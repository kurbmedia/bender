Bender = require('bender')

class Bender.Element extends Bender.Module
  @extend Bender.Events
  
  # the actual UI element
  _target: null
  
  ##
  # Utilize an internal method for binding TI
  # events. This way they can effectively be 
  # cleaned up
  #
  _boundEvents: []
  
  ##
  # Provide a list of default options, easilly
  # overridden globally. Options passed to the constructor
  # will override defaults. 
  #
  options: {}
  
  constructor:(options = {})->
    @options = _.extend(@options, options)