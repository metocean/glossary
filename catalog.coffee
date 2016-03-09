parse = require './parse'
path = require 'path'
fs = require 'fs'

dir = path.join process.cwd(), 'glossary'
files = fs.readdirSync dir
results = []
for file in files
  continue if file.substr(-3) isnt '.md'
  continue if file is 'index.md'
  contents = fs.readFileSync path.join(dir, file), 'utf8'
  contents = parse contents
  contents.meta.filename = file[0...-3]
  results.push contents.meta
results.sort (a,b) ->
  return -1 if a.filename < b.filename
  return 1 if a.filename > b.filename
  0
fs.writeFileSync 'catalog.json', JSON.stringify results, null, 2