(function() {
  var Bender;
  Bender = this.Bender = {};
  module.exports = Bender;
  Bender.Module = require('./module');
  Bender.Events = require('./events');
  Bender.Logger = require('./logger');
  Bender.require = function(path) {
    return require("./" + path);
  };
}).call(this);
