// Application.cfc
component {
  this.name = "myApp";
  this.blockedExtForFileUpload = "*";
  this.scriptProtect					 = "all";
  this.sessioncookie = {
    httpOnly: true,
    secure  : true
  };
}
