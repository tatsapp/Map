<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<title>Results in table</title>
</head>
<body>
<%-- <% JSONObject json = (JSONObject)(request.getParameter("result")); %> --%>
<input type="text" value="<%=request.getParameter("find")%>" id="re" name="resl" >
<div id="dc"></div>
<h1 style="background:#387ef5">Employee Analysis</h1>
<input style="margin-left:40px" type="button" value="Back" onclick="window.history.back()">
  <table>
    <thead style="color:white;background:grey">
      <tr>
        <th>Name</th>
        <th>Home</th>
        <th>Work</th>
        <th>Function</th>
        <th>Supervisor</th>
      </tr>
    </thead>
    <tbody>
       
    </tbody>
  </table>
  
 <script>
  $(document).ready(function(){
	  var res=$('#re').val();
	  $.ajax({
		  url:'http://maps.googleapis.com/maps/api/geocode/json',
		  method:'get',
		  data:{address:res},
		  dataType:'json',
		  success:function(data){
		     var d='<tr><td>'+data.results[0].geometry.location.lat+'</td><td>'+data.results[0].geometry.location.lng+'</td><td>'+"c"+'</td><td>'+"a"+'</td><td>'+"b"+'</td>';
		     var s='<tr><td>'+data.results[0].geometry.location.lat+'</td><td>'+data.results[0].geometry.location.lng+'</td><td>'+"c"+'</td><td>'+"a"+'</td><td>'+"b"+'</td>';
             d+=s;
		     $(d).appendTo('table tbody');
		  }
	  })
  })
 </script>
</body>
</html>
