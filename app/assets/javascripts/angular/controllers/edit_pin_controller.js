controllers.controller('editPinController', ['$scope', 'demandFormFactory', 'mapFactory' ,'$location', function($scope, demandFormFactory, mapFactory, $location){

  $scope.markers = null;
  $scope.map = mapFactory.buildMap('user-map');
  $scope.demand = demandFormFactory;
  $scope.userMarker;



  $scope.initialize = function() {
    if (!$scope.demand.user) {
      $location.path('/demands/new');
    }

    $scope.setupAutoComplete();
  }

 

  $scope.setupAutoComplete = function() {
    var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-23.0763561, -43.7959671),
      new google.maps.LatLng(-22.7259989, -43.0799675)
    );

    var options = { bounds: defaultBounds, componentRestrictions: { country: 'BR' } };
    var input = document.getElementById('searchTextField');

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    

    google.maps.event.addListener(autocomplete, 'place_changed', function(){

      var place = autocomplete.getPlace();
      var lat = place.geometry.location.k;
      var lng = place.geometry.location.D;
      

      $scope.demand.pin_fullname = place.formatted_address;

      // latitude, longitude
      $scope.showMarkerOnAutocomplete(lat, lng);
  
      $scope.updateDemandPins(lat, lng);

      $scope.$apply();

    });

  }


  $scope.updateDemandPins = function(lat, lng) {
      $scope.demand.latitude = lat;
      $scope.demand.longitude = lng;
      $scope.$apply();
  }


  $scope.showMarkerOnAutocomplete = function(lat, lng){

    if ( $scope.markers != null ) {
        $scope.markers.clearLayers();
    }

    var icon = L.icon({ iconUrl: 'http://i.imgur.com/S7CbL0Q.png', iconSize: [60, 106], iconAnchor: [60, 100] });
    var marker = L.marker([lat, lng], { icon: icon, draggable: true });

    $scope.markers = L.layerGroup([marker])
    $scope.markers.addTo( $scope.map );

    $scope.map.setView(new L.LatLng(lat, lng), 17)
  
    $scope.watchMarkerDragEnd(marker); 


  }


  $scope.watchMarkerDragEnd = function(marker) { 

    marker.on('dragend', function(event){
      var target = event.target
      $scope.userMarker = target.getLatLng();
      $scope.updateSearchOnDrag($scope.userMarker.lat, $scope.userMarker.lng);
      $scope.updateDemandPins($scope.userMarker.lat, $scope.userMarker.lng);      
      $scope.$apply();
    });

  }


  $scope.updateSearchOnDrag = function(lat, lng) {

    var geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(lat, lng);

    geocoder.geocode({ 'latLng': latlng  }, function(results, status){
      if ( status == google.maps.GeocoderStatus.OK ) {
        
        if (results[1]) {
          console.log(results[1]);
          $scope.demand.pin_fullname = results[1].formatted_address;
          $scope.$apply();

        }
      }
    
    });


    
  }

  $scope.reset = function() {
    $scope.demand = null;
  }


  $scope.nextStep = function() {
    $location.path('/demands/create'); 
  }


  $scope.$on('$locationChangeStart', function(event){
    $scope.map.remove();
  });
 


  $scope.initialize();


}]);
