c = require('colorize').console

class Logger
  info: (message)-> c.log("#green[[info]] #{message}")
  error: (message)-> c.log("#red[[error]] #{message}")
  warn: (message)-> c.log("#yellow[[warn]] #{message}")

module.exports = new Logger()