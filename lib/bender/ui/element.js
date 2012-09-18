(function() {
  var Bender;
  var __hasProp = Object.prototype.hasOwnProperty, __extends = function(child, parent) {
    for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; }
    function ctor() { this.constructor = child; }
    ctor.prototype = parent.prototype;
    child.prototype = new ctor;
    child.__super__ = parent.prototype;
    return child;
  };
  Bender = require('bender');
  Bender.Element = (function() {
    __extends(Element, Bender.Module);
    Element.extend(Bender.Events);
    Element.prototype._target = null;
    Element.prototype._boundEvents = [];
    Element.prototype.options = {};
    function Element(options) {
      if (options == null) {
        options = {};
      }
      this.options = _.extend(this.options, options);
    }
    return Element;
  })();
}).call(this);
