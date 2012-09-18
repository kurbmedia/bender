View = Bender.require('ui/view')

describe 'Bender.View', ()->
  
  it 'extends Titanium.UI.Window', ()->
    view = new View()
    view.name
      .should.equal('Titanium.UI.Window')