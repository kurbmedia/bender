class Module
  @include: (obj) ->
    throw new Error('include(obj) requires obj') unless obj
    for key, value of obj when key not in ['included', 'extended']
      @::[key] = value
    obj.included?.apply(this)
    this

  @extend: (obj) ->
    throw new Error('extend(obj) requires obj') unless obj
    for key, value of obj when key not in ['included', 'extended']
      @[key] = value
    obj.extended?.apply(this)
    this
  
  constructor: ->
    @init?(arguments...)

module.exports = Module