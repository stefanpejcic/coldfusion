var logDir = expandPath( "/logs/" );
var logs = directoryList(
  path = logDir,
  listInfo = "name",
  filter = "*.log",
  type = "file",
  recurse = "false"
);
for( var log in logs ){
  var fullPath = logDir & log ;
  if( fileExists( fullPath ) ){
    fileDelete( fullPath );
  }
}
