var map;
	var customIcons = {
		  House: {
			icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|00CED1|000000',
			shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  },
		  Apartment: {
			icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|D2B48C|000000',
			shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  },
		  Townhome: {
			icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|8080E6|000000',
			shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  },
		  "Apartment, Townhome": {
			icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=|D2B48C|000000',
			shadow: 'http://labs.google.com/ridefinder/images/mm_20_shadow.png'
		  }
		};
    var arrMarkers = [];
    var arrInfoWindows = [];
    var currentInfoWindow = null; 
     
    function mapInit(){
        var centerCoord = new google.maps.LatLng(39.17093, -86.53486); 
        var mapOptions = {
            zoom: 14,
            center: centerCoord,
			mapTypeId: 'roadmap'
        };
        map = new google.maps.Map(document.getElementById("map"), mapOptions);
        
        $.getJSON("/property.json?property_type=" + property_type + "&availability=" + availability + "&bedrooms=" + bedrooms, {}, function(json){
            $.each(json, function(i,item){
                $("#markers").append('<li><a href="#" rel="' + i + '">' + item.address + '</a></li>');
                var icon = customIcons[item.property_type] || {};
                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(item.lat, item.lng),
                    map: map,
                    icon: icon.icon,
            		shadow: icon.shadow
                });
                arrMarkers[i] = marker;
                var infowindow = new google.maps.InfoWindow({
                    content: '<strong>More Info</strong></a>'  
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
	