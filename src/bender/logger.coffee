class Logger
  info: (message)->     
    func.info(message)
  error: (message)-> 
    func.error(message)
  debug: (message)-> 
    func.debug(message)
  warn: (message)-> 
    func.debug(message)

func = if Titanium.Platform.name is 'mobileweb' then console else Titanium.API

module.exports = new Logger()