{ component, widget, hub, dom } = require 'odojs'
relay = require 'odo-relay'
exe = require 'odoql-exe'
odoql = require 'odoql/odojs'
component.use odoql

parse = require './parse'
store = require 'odoql-store'
request = require 'superagent'

getfilename = ->
  file = window.location.search
  file = file.substr 1 if file.length > 1
  file = 'index' if file is ''
  file

store = store()
  .use 'catalog', (params, cb) ->
    request
      .get './catalog.json'
      .end (err, res) ->
        return cb err if err?
        return cb new Error res.text if not res.ok
        cb null, res.body
  .use 'content', (params, cb) ->
    request
      .get "./glossary/#{getfilename()}.md"
      .end (err, res) ->
        return cb err if err?
        return cb new Error res.text if not res.ok
        cb null, res.text

hub = hub()
exe = exe hub: hub
  .use store

ql = require 'odoql'
ql = ql
  .use 'store'

katex = require 'katex'
kramed = require 'kramed'
renderrichtext = widget
  render: (state, params) ->
    dom 'div.definition'
  afterMount: (el, state, params) ->
    el.innerHTML = kramed params
    equations = document.querySelectorAll 'script[type^=math]'
    for equation in equations
      eq = document.createElement 'span'
      equation.parentNode.insertBefore eq, equation
      katex.render equation.innerHTML, eq
      equation.parentNode.removeChild equation
  onUpdate: (el, state, params) ->
    el.innerHTML = kramed params

router = component
  query: (params) ->
    catalog: ql.store 'catalog'
    content: ql.store 'content'
  render: (state, params, hub) ->
    content = parse state.content
    dom '#root.container', [
      dom 'h4.pull-right', dom 'a', { attributes: href: "https://github.com/metocean/glossary/blob/gh-pages/glossary/#{getfilename()}.md" }, 'Pull requests welcome & encouraged'
      dom 'h4', dom 'a', { attributes: href: './' }, dom 'h4', 'MetOcean Glossary'
      dom '.row', [
        dom '.col-xs-3.toc', [
          dom 'h6', 'Table of contents'
          dom '.list-group', state.catalog.map (item) ->
            dom "a.list-group-item#{if getfilename() is item.filename then '.active' else ''}", { attributes: href: "?#{item.filename}" }, item.title ? item.filename
        ]
        dom '.col-xs-9.content', [
          dom 'h6', 'Definition'
          renderrichtext null, content.text
        ]
      ]
    ]

root = document.querySelector '#root'
scene = relay root, router, exe, hub: hub
scene.update()
