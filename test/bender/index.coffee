describe 'Bender', ()->
  
  it 'exposes a Module property', ()->
    Bender.should.have.property('Module')
  
  it 'exposes a Logger property', ()->
    Bender.should.have.property('Logger')

  it 'exposes an Events property', ()->
    Bender.should.have.property('Events')
