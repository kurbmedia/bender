funcs = ['info', 'debug', 'error']

describe 'Bender.Logger', ()->
  
  funcs.forEach (m)->
    it "provides a #{m} method", ()->
        Bender.Logger[m].should
          .be.a('function')