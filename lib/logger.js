(function() {
  var Logger, c;
  c = require('colorize').console;
  Logger = (function() {
    function Logger() {}
    Logger.prototype.info = function(message) {
      return c.log("#green[[info]] " + message);
    };
    Logger.prototype.error = function(message) {
      return c.log("#red[[error]] " + message);
    };
    Logger.prototype.warn = function(message) {
      return c.log("#yellow[[warn]] " + message);
    };
    return Logger;
  })();
  module.exports = new Logger();
}).call(this);