var map;
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
    var arrMarkers = [];
    var arrInfoWindows = [];
    var currentInfoWindow = null; 
     
    function mapInit(){
        var centerCoord = new google.maps.LatLng(lat, lng); 
        var mapOptions = {
            zoom: 17,
            center: centerCoord,
			mapTypeId: 'satellite'
        };
        map = new google.maps.Map(document.getElementById("dorm-location"), mapOptions);

        //Custom Marker at (lng,lat) of id# being viewed, Marker overlaps its original icon
          var myMarker1 = new google.maps.Marker({position: new google.maps.LatLng(lat, lng), zIndex: 1000, map: map, icon: 'http://maps.google.com/mapfiles/kml/shapes/arrow.png' });
         
        $.getJSON("/dorm.json", {}, function(json){
            $.each(json, function(i,item){
                $("#markers").append('<li><a href="#" rel="' + i + '">' + item.name + '</a></li>');
                var icon = customIcons[item.location] || {};
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(item.lat, item.lng),
                    map: map,
                    icon: icon.icon,
            		shadow: icon.shadow
                });
                arrMarkers[i] = marker;
                var infowindow = new google.maps.InfoWindow({
                    content: '<img src="/assets/dorms/' + item.name + '-1.jpg" class="mtb-5" id="gmap-iw-img">' +
		  			'<p class="m-0 text-center"><strong>' + item.name + '<strong></p>' +
		  			'<a href="dorm-page.php?id=' + item.name + '" target=_blank class="button blue-button" id="listing-btn"><strong>More Info</strong></a>'  
                });
                arrInfoWindows[i] = infowindow;
                google.maps.event.addListener(marker, 'click', function() {
                    if (currentInfoWindow != null) { 
        				currentInfoWindow.close(); 
    				} 
    				infowindow.open(map, marker); 
    				currentInfoWindow = infowindow; 
				}); 
            });
        });             
    }
    $(function(){
        // initialize map (create markers, infowindows and list)
        mapInit();
         
        // "live" bind click event
        $("#markers a").live("click", function(){
            var i = $(this).attr("rel");
            arrInfoWindows[i].open(map, arrMarkers[i]);
        });
    });