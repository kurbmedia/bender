{print}           = require 'util'
{spawn, exec}     = require 'child_process'
fs                = require 'fs'
path              = require 'path'
logger            = require('colorize').console
props             = JSON.parse(fs.readFileSync('./package.json'))

build = (callback)->
  coffee = spawn 'coffee', ['-c', '-o', 'lib', 'src']
  coffee.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  coffee.stdout.on 'data', (data) ->
    print data.toString()
  coffee.on 'exit', (code) ->
    callback?() if code is 0

test = (callback)->
  mocha = spawn "./node_modules/.bin/mocha", [ 
    "--reporter", "spec", 
    "--ui", "bdd", 
    "--compilers", "coffee:coffee-script", 
    "--growl", 
    "--bail", 
    "--colors",
    "--require",
    "should",
    "--require",
    "lib/bender"
  ]
  mocha.stderr.on 'data', (data) ->
    process.stderr.write data.toString()
  mocha.stdout.on 'data', (data) ->
    print data.toString()
  mocha.on 'exit', (code) ->
    callback?() if code is 0

task 'build', 'Building source from src/', ->
  build()

task 'test', 'Run test suite with mocha', ->
  test()

task 'watch', 'Watch source files to compile, test files to run', ->
  tests  = files("./test/")
  source = files("./src/")
  banner("Watching Files")
  warn_missing_tests(source)
  watch(tests, (file)->
    logger.info("#green[info] #{file} saved. Running Tests")
    test()
  )
  watch(source, (file)->
    logger.info("#green[info] #{file} saved. Rebuild.")
    build()
  )
  

files =(dir, ret)->
  ret = ret || [];
  fs.readdirSync(dir).forEach((file)->
    file = path.join(dir, file)
    if fs.statSync(file).isDirectory()
      files(file, ret)
    else if file.match(/\.(js|coffee)$/)
      ret.push(file)  
  )
  ret
  

watch = (files, callback)->
  files.forEach((file)->
    fs.watchFile file, { interval: 100 }, (curr, prev)->
      if prev.mtime < curr.mtime
        callback(file)
  )

banner = (text)->
  logger.info("")
  logger.info("#cyan[Bender] #{props.version}")
  logger.info(text)
  logger.info("-------------------------\n")
  
warn_missing_tests = (sources)->
  missing = false
  sources.forEach (file)->
    basename = path.basename(file, '.coffee')
    testname = path.join("./test/", "#{basename}.coffee")
    unless fs.existsSync(testname)
      logger.info("#yellow[warning] test missing for #{file}")
      missing = true
  logger.info("") if missing is true