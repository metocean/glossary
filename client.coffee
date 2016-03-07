{ component, widget, hub, dom } = require 'odojs'
relay = require 'odo-relay'
exe = require 'odoql-exe'
odoql = require 'odoql/odojs'
component.use odoql

hub = hub()
exe = exe hub: hub

katex = require 'katex'
kramed = require 'kramed'
renderrichtext = widget
  render: (state, params) ->
    dom 'div'
  afterMount: (el, state, params) ->
    #katex.render "c = \\pm\\sqrt{a^2 + b^2}", el
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
  render: (state, params, hub) ->
    params.autocomplete ?= {}
    dom '#root.container', [
      renderrichtext null, """
      # Woohoo

      I am using __markdown__

      - One
      - Two
      - Three $$c = \\pm\\sqrt{a^2 + b^2}$$

      $$
       \\frac{1}{\\displaystyle 1+
         \\frac{1}{\\displaystyle 2+
         \\frac{1}{\\displaystyle 3+x}}} +
       \\frac{1}{1+\\frac{1}{2+\\frac{1}{3+x}}}
      $$

      """
    ]

root = document.querySelector '#root'
scene = relay root, router, exe, hub: hub

hub.every 'update', (p, cb) ->
  scene.update p
  cb()

scene.update {}
