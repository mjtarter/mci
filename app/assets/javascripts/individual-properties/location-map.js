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
    var lat = lat
    var lng = lng
     
    function mapInit(){
        var centerCoord = new google.maps.LatLng(lat, lng); 
        var mapOptions = {
            zoom: 17,
            center: centerCoord,
			mapTypeId: 'satellite'
        };
        map = new google.maps.Map(document.getElementById("location"), mapOptions);

        //Add price range to IW when applicable
        function priceRange(rent_two) {
            if (rent_two !== null) {
                return ' - $' + rent_two } else {
                    return ''
                };
            };

        //Output sqft if not null
        function sqftOutput(sqft) {
            if (sqft !== null) {
                return sqft } else {
                    return ''
                };
            };
        
        //Custom Marker at (lng,lat) of id# being viewed, Marker overlaps its original icon
        var myMarker1 = new google.maps.Marker({position: new google.maps.LatLng(lat, lng), zIndex: 1000, map: map, icon: 'http://maps.google.com/mapfiles/kml/shapes/arrow.png' });
        
        var params = {
            property_type: property_type,
            availability: availability,
            bedrooms: bedrooms,
            min_rent: min_rent,
            max_rent: max_rent
        }

        $.getJSON("/property.json", params, function(json){
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
                    content: '<div id="img-container">' + 
                            '<span class="glyphicon glyphicon-map-marker plr-5" style="height:10px;"></span>' +
                            '<strong>' + item.address + '<span class="pull-right plr-5"> $' + item.rent + priceRange(item.rent_two) + '</span>' + "</strong> <br/>"  + 
                            '<img src="/assets/properties/' + item.id + '.jpg" id="gmap-iw-img">' + 
                            '<div id="iw-overlay">' + 
                                '<table class="text-center" id="iw-overlay-table">' +
                                    '<tr>' +
                                        '<td class="vert-middle"><p class="no-margin"><strong>Property Manager:<br></strong>' + item.property_manager + '</p></td>' + 
                                    '</tr>' +
                                '</table>' + 
                            '</div>' + 
                        '</div>'  +
                        '<ul class="pad-vert-5 iw-basic-info clearfix">' + 
                            '<li class="ie-nth-child-odd"><strong>Bedrooms:</strong><br>' + item.bedrooms + '</li>' + 
                            '<li class="text-center ie-nth-child-even"><strong>Baths:</strong><br>' + item.baths + '</li>' + 
                            '<li class="text-right ie-nth-child-odd"><strong>Type:</strong><br>' + item.property_type +'</li>' +
                            '<li class="ie-nth-child-even"><strong>Sqft:</strong><br>' + sqftOutput(item.sqft) + '</li>' + 
                            '<li class="text-center ie-nth-child-odd"><strong>Floors:</strong><br>' + item.floors + '</li>' +
                            '<li class="text-right ie-nth-child-even"></li>' +
                        '</ul>' +
                        '<a href=show?id=' + item.id  + ' target=_blank class="button blue-button" id="listing-btn"><strong>View Listing</strong></a>' 
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
	