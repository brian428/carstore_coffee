fs = require 'fs'

{print} = require 'util'
{spawn} = require 'child_process'


build = (callback) ->
  coffee = spawn 'coffee.cmd', ['-c', '-o', 'app', 'coffee']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0


task 'build', 'Build app/ from coffee/', ->
  build()


task 'watch', 'Watch coffee/ for changes', ->
  console.log "Starting CoffeeScript compiler (watching for changes in /coffee folder)..."
  coffee = spawn 'coffee.cmd', ['-w', '-c', '-o', 'app', 'coffee']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()  