// Application.cfc
component {
  // ...
  function onError( exception ){
   // uLogging error with logbox...
    writeOutput( "Upisivanje greske u log fajlu.." );
    logger.error(
        "Doslo je do greske u aplikaciji: #exception.message# #exception.detail#"
        exception
    );

    // error page
    include "views/error.cfm";
  }
}
