<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="./WEB-INF/Header.jsp"></jsp:include>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
	<ol class="carousel-indicators">
    	<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    	<li data-target="#myCarousel" data-slide-to="1"></li>
    	<li data-target="#myCarousel" data-slide-to="2"></li>
  	</ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      	<img src="./images/carousel/back_4.jpg" alt="New York">
    </div>
    <div class="item">
      <img src="./images/carousel/back_2.jpg" alt="Chicago">
    </div>
    <div class="item">
      <img src="./images/carousel/back_3.jpg" alt="Los Angeles">
    </div>
  </div>
    
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    	<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    	<span class="sr-only">Previous</span>
  	</a>
  	<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    	<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    	<span class="sr-only">Next</span>
  	</a>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-offset-1 col-sm-4 offers">
			<img src="images/offers/offer_1.jpg" width="350" height="300">
			<h3>Large Pizza offer</h3>
			<span>Large one topping pizza</span>
		</div>
		<div class="col-sm-4 offers">
			<img src="images/offers/offer_1.jpg" width="350" height="300">
			<h3>Large Pizza offer</h3>
			<span>Large one topping pizza</span>
		</div>
		<div class="col-sm-4 offers">
			<img src="images/offers/offer_1.jpg" width="350" height="300">
			<h3>Large Pizza offer</h3>
			<span>Large one topping pizza</span>
		</div>
	</div>
</div>

<span class="text-center"><h2>We are located at</h2></span>
<script src='https://maps.googleapis.com/maps/api/js?v=3.exp'>
</script><div class="map-div" style='overflow:hidden;height:440px;width:100%;'>
<div id='gmap_canvas'style='height:440px;width:100%;'>
</div><div><small><a href="http://embedgooglemaps.com">									embed google maps							</a></small></div><div><small><a href="http://buywebtrafficexperts.com">buy website traffic</a></small></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div><script type='text/javascript'>function init_map(){var myOptions = {zoom:10,center:new google.maps.LatLng(41.1682883,-73.19323279999998),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(41.1682883,-73.19323279999998)});infowindow = new google.maps.InfoWindow({content:'<strong>Arthur\'s Famous Pizza</strong><br> 430 Park Ave, Bridgeport, CT 06604<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>
<jsp:include page="./WEB-INF/Footer.jsp"></jsp:include>
</body>
</html>