//<![CDATA[
	
		var customIcons = {
		  Northwest: {
		    icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|0099FF|000000',
		    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  },
		  Central: {
		    icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|00CED1|000000',
		    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  },
			Southeast: {
		    icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|F5DEB3|000000',
		    shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  }
		};

		function plot_dorm_data() {
		  var map = new google.maps.Map(document.getElementById("dorm-map"), {
			center: new google.maps.LatLng(39.171385, -86.517715),
			zoom: 14,
			mapTypeId: 'roadmap'
		  });

		  var infoWindow = new google.maps.InfoWindow;
			  closeBoxMargin: "12px 4px 2px 2px"
	
	
		  // Change this depending on the name of your PHP file
      downloadUrl("dorm-map.php", function(data) {
        var xml = data.responseXML;
        var markers = xml.documentElement.getElementsByTagName("marker");
        for (var i = 0; i < markers.length; i++) {
          var Name = markers[i].getAttribute("Name");
          var address = markers[i].getAttribute("address");
          var location = markers[i].getAttribute("location");
          var point = new google.maps.LatLng(
              parseFloat(markers[i].getAttribute("lat")),
              parseFloat(markers[i].getAttribute("lng")));
		  var html = '<img src="photos/dorms/' + Name + '-1.jpg" class="margin-vert-5" id="gmap-iw-img">' +
		  			'<p class="no-margin text-center"><strong>' + Name + '<strong></p>' +
		  			'<a href="dorm-page.php?id=' + Name + '" target=_blank class="button blue-button" id="listing-btn"><strong>More Info</strong></a>';
		  var icon = customIcons[location] || {};
          var marker = new google.maps.Marker({
            map: map,
            position: point,
            icon: icon.icon,
            shadow: icon.shadow
          });
          bindInfoWindow(marker, map, infoWindow, html);
        }
      });
    }
		
		function bindInfoWindow(marker, map, infoWindow, html) {
		  google.maps.event.addListener(marker, 'click', function() {
			infoWindow.setContent(html);
			infoWindow.open(map, marker);
		  });
		}
	
		function downloadUrl(url, callback) {
		  var request = window.ActiveXObject ?
			  new ActiveXObject('Microsoft.XMLHTTP') :
			  new XMLHttpRequest;
	
		  request.onreadystatechange = function() {
			if (request.readyState == 4) {
			  request.onreadystatechange = doNothing;
			  callback(request, request.status);
			}
		  };
	
		  request.open('GET', url, true);
		  request.send(null);
		}
	
		function doNothing() {}
	
//]]> 
	