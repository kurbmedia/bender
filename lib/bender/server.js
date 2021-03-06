(function() {
  var Logger, fs, http, path, port, root, url;
  http = require("http");
  url = require("url");
  path = require("path");
  fs = require("fs");
  root = process.cwd();
  port = 9876;
  Logger = require('./logger');
  http.createServer(function(request, response) {
    var filename, uri;
    uri = url.parse(request.url).pathname;
    logger.log("[info] processing " + uri + "...");
    filename = path.join(root, uri);
    return fs.exists(filename, function(exists) {
      if (!exists) {
        response.writeHead(404, {
          "Content-Type": "text/plain"
        });
        response.write("404 Not Found\n");
        response.end();
        Logger.error("Could not find " + filename);
        return;
      }
      return fs.readFile(filename, "binary", function(error, file) {
        if (error) {
          response.writeHead(500, {
            "Content-Type": "text/plain"
          });
          response.write(error + "\n");
          response.end();
          Logger.error(error);
          return;
        }
        response.writeHead(200);
        response.write(file, "binary");
        response.end();
        return Logger.info(">>> OK!");
      });
    });
  }).listen(port);
  Logger.info("server running at http://localhost:" + port + '/');
  Logger.info("serving files from " + root);
}).call(this);
