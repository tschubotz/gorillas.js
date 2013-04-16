fs     = require 'fs'
{exec} = require 'child_process'

app_files  = [
  # omit src/ and .coffee to make the below lines a little shorter
  'Main',
  'Tree',
  'Gorilla',
  'GorillasGame',
  'Renderer'
]

app_name = 'gorillas' # output file name is gonna be gorillas.js

task 'build', 'Build single application file from source files', ->
  app_contents = new Array remaining = app_files.length
  console.log "\nStep 1: Merge files to #{app_name}.coffee"
  for file, index in app_files then do (file, index) ->
    console.log "Processing #{file}.coffee ..."
    fs.readFile "src/#{file}.coffee", 'utf8', (err, file_contents) ->
      throw err if err
      app_contents[index] = file_contents
      process() if --remaining is 0
    console.log 'done.'
  process = ->
    fs.writeFile "lib/#{app_name}.coffee", app_contents.join('\n\n'), 'utf8', (err) ->
      throw err if err
      console.log '\nStep 2: Compile'
      exec "coffee --compile lib/#{app_name}.coffee", (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr
        fs.unlink "lib/#{app_name}.coffee", (err) ->
          throw err if err
          console.log 'Done.'

