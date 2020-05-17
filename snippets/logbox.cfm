// Application.cfc
component {
  // ...
  function onError( exception ){
   // uLogging error with logbox...
    writeOutput( "Saving error in log file.." );
    logger.error(
        "An error occured: #exception.message# #exception.detail#"
        exception
    );

    // error page
    include "views/error.cfm";
  }
}
