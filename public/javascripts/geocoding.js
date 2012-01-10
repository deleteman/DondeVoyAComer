  
 var geocoder;
  var map;
  function initializeGeoCoding() {
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(-34.883611, -56.181944);
    var myOptions = {
      zoom: 14,
      center: latlng, 
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
  }

  function plotCoords(lat, lng) {
	geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(lat, lng);
	
    var myOptions = {
      zoom: 14,
      center: latlng, 
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
	var marker = new google.maps.Marker({
				map: map, 
				zoom:14,
				position: latlng
			});

  }

  function codeAddress() {
    var address = document.getElementById("place_address").value + ", montevideo, uruguay";
	if(address != "") {
		geocoder.geocode( { 'address': address, region:"UY"}, function(results, status) {
		  if (status == google.maps.GeocoderStatus.OK) {
			$("#place_lat").val(results[0].geometry.location.lat());
			$("#place_lng").val(results[0].geometry.location.lng());
			var marker = new google.maps.Marker({
				map: map, 
				zoom:14,
				position: results[0].geometry.location

			});
			map.setCenter(results[0].geometry.location);
		 } else {
			alert("No se pudo encontrar la dirección que ingresó por las siguientes razones: " + status);
		  }
		});
	}
  }