<!---
	Date:		02.11.2011
	Site 		knivis LLC
	Desc:		Simple GEO Location CFC
	
	Notes:		Simple GEO User A Free GEO WebService. http://freegeoip.appspot.com/
--->
<cfcomponent displayname="geolocation">
<cffunction name="getGeoLocation" access="public" returntype="struct" output="no">
<cfargument name="ipnumber" type="string" default="111.111.111.111">
<cfscript>
	geoReturnData = structNew();
	geoReturnArray = arrayNew(1);
	x = 1;
</cfscript>
   			<cftry>
                <cfhttp url="http://freegeoip.appspot.com/csv/#ipnumber#" resolveurl="no" throwonerror="yes" timeout="5"></cfhttp>
				<cfloop index = "ListElement" list = "#trim(cfhttp.FileContent)#"> 
    				<cfset geoReturnArray[x] = ListElement>
					 <cfset x++>
				</cfloop>
				<cfscript>
					geoReturnData.status = geoReturnArray[1];
					geoReturnData.ip = geoReturnArray[2];
					geoReturnData.countrycode = geoReturnArray[3];
					geoReturnData.countryname = geoReturnArray[4];
					geoReturnData.regioncode = geoReturnArray[5];
					geoReturnData.regionname = geoReturnArray[6];
					geoReturnData.city = geoReturnArray[7];
					geoReturnData.zipcode = geoReturnArray[8];
					geoReturnData.latitude = geoReturnArray[9];
					geoReturnData.longitude = geoReturnArray[10];
				</cfscript>				
                <cfcatch type="Any">
                <cfscript>
					geoReturnData.status = "NA";
					geoReturnData.ip = "NA";
					geoReturnData.countrycode = "NA";
					geoReturnData.countryname = "NA";
					geoReturnData.regioncode = "NA";
					geoReturnData.regionname = "NA";
					geoReturnData.city = "NA";
					geoReturnData.zipcode = "NA";
					geoReturnData.latitude = "NA";
					geoReturnData.longitude = "NA";
				</cfscript>
                </cfcatch>
 			 </cftry>
  
  <cfreturn geoReturnData>
</cffunction>
</cfcomponent>