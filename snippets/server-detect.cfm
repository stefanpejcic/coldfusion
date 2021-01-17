<!--- Elegant --->

<cfscript>
public function getServerFlavor() {
  local.cf_server = reReplaceNoCase(server.ColdFusion.ProductName, ".*(coldfusion|railo|bluedragon|lucee).*", "\1");
  local.server_version = listFind("coldfusion,bluedragon", rc.cf_server) ? listFirst( server.railo.version ) : server.coldfusion.productversion;
  return local;
}
</cfscript>


<!--- Elvis has left the building (or wasn't included in this CF version) --->

<cfscript>
function getServerFlavor() {
  local.cf_server = reReplaceNoCase(server.ColdFusion.ProductName, ".*(coldfusion|railo|bluedragon|lucee).*", "\1");
  if(listFind("coldfusion,bluedragon", rc.cf_server)) {
    local.server_version = server.coldfusion.productversion;
  } else {
    local.server_version = listFirst( server.railo.version );
  }
  return local;
}
</cfscript>
