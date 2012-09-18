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

test = (callback, file = null)->
  
  file = test_files().join(' ') if file is null
  
  exec "./node_modules/.bin/mocha #{file}", (err, stdout, stderr)->
    process.stderr.write stderr.toString()
    print stdout.toString()

task 'build', 'Building source from src/', ->
  build()

task 'test', 'Run test suite with mocha', ->
  test()

task 'watch', 'Watch source files to compile, test files to run', ->
  banner("Watching Files")
  warn_missing_tests
  watch(test_files(), (file)->
    logger.info("#green[info] #{file} saved. Running...")
    test()
  )
  watch(source_files(), (file)->
    logger.info("#green[info] #{file} saved. Test and build....")
    test(find_test(file))
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
  

test_files = ()-> files("./test/")
source_files = ()-> files("./src/")

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

find_test = (source)->
  basename = path.basename(source, '.coffee')
  testname = path.join("./test/", "#{basename}.coffee")

warn_missing_tests = ()->
  missing = false
  source_files.forEach (file)->
    unless fs.existsSync(find_test(file))
      logger.info("#yellow[warning] test missing for #{file}")
      missing = true
  logger.info("") if missing is true