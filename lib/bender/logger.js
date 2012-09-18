(function() {
  var Logger, func;
  Logger = (function() {
    function Logger() {}
    Logger.prototype.info = function(message) {
      return func.info(message);
    };
    Logger.prototype.error = function(message) {
      return func.error(message);
    };
    Logger.prototype.debug = function(message) {
      return func.debug(message);
    };
    Logger.prototype.warn = function(message) {
      return func.debug(message);
    };
    return Logger;
  })();
  func = Titanium.Platform.name === 'mobileweb' ? console : Titanium.API;
  module.exports = new Logger();
}).call(this);
