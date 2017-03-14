<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="style.css">
<link type="text/css" rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />
<link type="text/css" rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.0.3/dist/MarkerCluster.css">
<link type="text/css" rel="stylesheet" href="https://unpkg.com/leaflet.markercluster@1.0.3/dist/MarkerCluster.Default.css">
<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDshpeNfmfpmcKFmuHIts13kSRwDxuapGo" async defer></script>
<script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
<script src='https://unpkg.com/leaflet.gridlayer.googlemutant@latest/Leaflet.GoogleMutant.js'></script>
<script src="https://unpkg.com/leaflet.markercluster@1.0.3/dist/leaflet.markercluster.js"></script>

</head>
<body>
<form action="tableView.jsp" target="_blank">
<div id="header">
<h1 style="background:#387ef5"><a>Employee Analysis</a></h1>
 <input type="button" value="Logout" id="logout" onclick="window.location.href='index.jsp'">
 <input type="button" value="Click" id="bttn">
 <input type="submit" value="View Results in Table" id="table">
</div>

 <span style="font-size:30px;cursor:pointer" id="sear" onclick="openNav()">&#9776; Search</span>
  <div id="tog">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
  
     <input type="text" id="inp" name="find" placeholder="Search" autocomplete="on"> 
     <input type="button" id="check" name="search" value="Search">
     <br>
     <br>
      <span>Select a Industry</span>
      <br>
         	<select name="search">
         	<option value="Testing">Testing</option>
         	<option value="Development">Development</option>
         	<option value="Maintainance">Maintainance</option>
    	 	</select> 
      <br>
   
     <br>
     <span>Select a Profit Center</span>
   		<br>
   			<select name="search1">
     		<option value="Development">Development</option>
         	<option value="Maintainance">Maintainance</option>
         	<option value="Testing">Testing</option>
     		</select>
     	<br>
     <br>
     <span>Functional Roles</span>
   		<br>
   			<select name="search2">
     		<option value="Maintainance">Maintainance</option>
     		<option value="Development">Development</option>
         	<option value="Testing">Testing</option>
     		</select>
     	<br>
     <br>
     <span>Managers</span>
   		<br>
   			<select name="search3">
     		<option value="QE & A">QE & A</option>
     		<option value="Development">Development</option>
         	<option value="Maintainance">Maintainance</option>
     		</select>
     	
     	<br>
     </div>
      <div id="mapid" class="map1"></div>
      <script>
      var mymap =L.map('mapid',{
     	 center:[42.877742,-97.380979],
     	 zoom:4
        });
      var styled = L.gridLayer.googleMutant({
  	    type: 'roadmap'
  	   }).addTo(mymap);
      var markers;
      $(document).ready(function(){
    	  $('#check').click(function(){
    		  var res=$('#inp').val();
    		  var fs=$('#bax');
    		  //var f="a,b";
    		  //var c=f.split(",");
    		  //alert(c.length);
    		  if(markers){
    			  mymap.removeLayer(markers);
    		  }
    		  $.ajax({
    			  url:'http://maps.googleapis.com/maps/api/geocode/json',
    			  method:'get',
    			  data:{address:res},
    			  dataType:'json',
    			  success:function(data){
    				  //alert(data.results.length);
    				  
    				 var greenIcon =L.icon({
    	    	    	    iconUrl: 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png',
    	    	    	    iconSize:[25, 35], // 25 is width , 35 is height
    	    	    	    iconAnchor:   [0, 30], // point of the icon which will correspond to marker's location
    	    	    	    popupAnchor:  [0, -25] // point from which the popup should open relative to the iconAnchor where 0 is x-axis and -25 is y axis 
    	    	    	});
    	    	            	    	            	    	         
    	    	         markers = L.markerClusterGroup();
    	    	         var m;
                         //  alert(data.results[0].geometry.location.lat+" "+)
    	    	         m=L.marker([data.results[0].geometry.location.lat,data.results[0].geometry.location.lng],{icon:greenIcon}).bindPopup("Checked");
    	    	         markers.addLayer(m);
    	    	         m= L.marker( [42.877742,-97.380979] ,{icon:greenIcon}).bindPopup("1");
    	    	         markers.addLayer( m );
    	    	         m= L.marker( [43.877742,-97.380979],{icon:greenIcon}).bindPopup("2");
    	    	         markers.addLayer( m );
    	    	         m= L.marker( [42.877742,-98.380979],{icon:greenIcon}).bindPopup("3");
    	    	         markers.addLayer( m );
    	    	         m= L.marker( [44.877742,-97.380979] ,{icon:greenIcon}).bindPopup("4");
    	    	         markers.addLayer( m );
    	    	         m= L.marker( [42.877742,-99.380979],{icon:greenIcon}).bindPopup("clkd");
    	    	         markers.addLayer( m ); 
    	    	         mymap.addLayer( markers );
    			  }
    		  })
    	  })
    		      	 
      })
      
        function openNav() {
   			 document.getElementById("tog").style.width = "30%";
   			document.getElementById("mapid").style.left = "30%";
    		document.getElementById("mapid").style.width = "70%";
		 }

		function closeNav() {
    		document.getElementById("tog").style.width = "0%";
    		document.getElementById("mapid").style.left = "0%";
    		document.getElementById("mapid").style.width = "100%";
		}
      </script>
 </form>
</body>
</html>