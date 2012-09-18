Bender = @Bender = {}
module.exports = Bender
  
Bender.Module = require './module'
Bender.Events = require './events'
Bender.Logger = require './logger'

Bender.require = (path)-> require("./#{path}")(Bender)