http = require("http")
url  = require("url")
path = require("path")
fs   = require("fs")
  
root = process.cwd()
port = 9876

Logger = require('./logger')

http.createServer( (request, response)->
  uri = url.parse(request.url).pathname
  logger.log "[info] processing " + uri + "..."
  filename = path.join(root, uri)
  fs.exists filename, (exists)->
    unless exists
      response.writeHead(404, { "Content-Type": "text/plain" })
      response.write("404 Not Found\n")
      response.end()
      Logger.error("Could not find #{filename}")
      return

    fs.readFile filename, "binary", (error, file)->
      if error
        response.writeHead(500, {"Content-Type": "text/plain"})
        response.write(error + "\n")
        response.end()
        Logger.error(error)
        return
      
      response.writeHead(200)
      response.write(file, "binary")
      response.end()
      Logger.info(">>> OK!")

).listen(port)

Logger.info("server running at http://localhost:" + port + '/')
Logger.info("serving files from " + root)