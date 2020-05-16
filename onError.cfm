/** Application.cfc **/
  public function onError(required exception, required string eventName)
  {
    var factory = new App.ExceptionFactory();
    var e = factory.getNewException(arguments.eventName, arguments.exception);

    if (e.logError()) {
      /** we cauld also have a logging cfc etc **/
      var loggingFile = new App.SomeLoggingCfc(arguments.eventName, arguments.exception);
      loggingFile.commitLog();
    }
    if (e.debugError()) {
      // show developer info here
    }
    
    /** Throw the exception **/
    e.throwException();
  } 

  /** App.ExceptionFactory **/
  public ExceptionFactory function getNewException(required string eventName, required exception)
  {
    return new "App.#exception.type#"(argumentCollection = arguments);
  } 

  /** App.Exception.CustomException **/
  public boolean function logError()
  {
  # do something here
  }
  public boolean function debugError() {}

  public function throwException()
  {
  # do something as well
  }

