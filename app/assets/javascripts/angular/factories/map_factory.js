demandsApp.factory('mapFactory', ['$resource', function($resource){
  
  return { 
    buildMap: function(map_name) {

      // Get MAP name or set default one
      var mapId = (map_name == '') ? 'map' : map_name;

      // Set map style and zoom options
      var mapOptions = {
        minZoom: 12,
        zoom: 12,
        styles: this.mapStyle,
        center: new google.maps.LatLng(-22.9083, -43.2108),
        mapTypeId: google.maps.MapTypeId.ROADMAP
      }


      var allowedBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(-23.0763561, -43.7959671), // southwest
        new google.maps.LatLng(-22.7259989, -43.0799675) // northeast
      )

      var map = new google.maps.Map(
        document.getElementById(mapId), mapOptions
      );

      var mapCenter = map.getCenter();

      google.maps.event.addListener(map, 'dragstart', function() {
          mapCenter = map.getCenter();
      });


      map.fitBounds(allowedBounds);


      google.maps.event.addListener(map, 'dragend', function() {
        if (allowedBounds.contains(map.getCenter())) return;
        map.panTo(mapCenter);
      });

      return map;

    },

    mapStyle: [{"featureType":"water","stylers":[{"saturation":40},{"lightness":-17},{"hue":"#0088ff"}]},{"featureType":"road","elementType":"geometry.fill","stylers":[{"hue":"#ff0000"},{"saturation":-100},{"lightness":99}]},{"featureType":"road","elementType":"geometry.stroke","stylers":[{"color":"#808080"},{"lightness":54}]},{"featureType":"landscape.man_made","elementType":"geometry.fill","stylers":[{"color":"#ece2d9"}]},{"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#ccdca1"}]},{"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#767676"}]},{"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#ffffff"}]},{"featureType":"poi","stylers":[{"visibility":"on"}]},{"featureType":"landscape.natural","elementType":"geometry.fill","stylers":[{"visibility":"on"},{"color":"#EBE5E0"}]},{"featureType":"poi.park","stylers":[{"visibility":"on"}]},{"featureType":"poi.sports_complex","stylers":[{"visibility":"on"}]}]
    
  }

}]);
// Old code

/*      L.Icon.Default.imagePath = 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.3/images'; */


      //// set map view to the city boundaries
      //var bounds = L.latLngBounds(L.latLng(-23.0763561, -43.7959671), L.latLng(-22.7259989, -43.0799675));

      //var map = L.map(map_id, { 
        //fullScreen: true, 
        //scrollWheelZoom: true,
        //maxBounds: bounds
      //}).setView([-22.9083, -43.2108], 12);

      //// 1 - Positron Dark: http://{s}.basemaps.cartocdn.com/dark_all/{z}/{x}/{y}.png 
      //// 2 - MapBox: http://{s}.tiles.mapbox.com/v4/luizfonseca.7532f8a3/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibHVpemZvbnNlY2EiLCJhIjoiMTFNcXRXdyJ9.5PRw57nx5srpwP838-KjVQ
      //// 3 - Positron Light http://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}.png
      //var layer = L.tileLayer('http://{s}.tiles.mapbox.com/v4/luizfonseca.7532f8a3/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibHVpemZvbnNlY2EiLCJhIjoiMTFNcXRXdyJ9.5PRw57nx5srpwP838-KjVQ', {
        //attribution: '&copy; LAB.Rio'
      //});


      //map.addLayer(layer);

      /*return map;*/
