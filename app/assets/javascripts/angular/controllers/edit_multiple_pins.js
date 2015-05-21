controllers.controller('routingController', [
  '$scope', 'demandFormFactory', 'mapFactory' ,'$location',
  function($scope, demandFormFactory, mapFactory, $location){



  $scope.markers = null;
  $scope.pins = [];
  $scope.demand = demandFormFactory;
  $scope.userMarker;
  $scope.icon = L.icon({ iconUrl: 'http://i.imgur.com/118IZhj.png', iconSize: [31, 59]});


  $scope.initialize = function() {
/*    if (!$scope.demand.user) {*/
      //$location.path('/demands/new');
    /*}*/
   

    $scope.map = mapFactory.buildMap('user-map');
    $scope.map.setZoom(13);
    $scope.setupAutoComplete();
  }

 

  $scope.setupAutoComplete = function() {
    var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-23.0763561, -43.7959671),
      new google.maps.LatLng(-22.7259989, -43.0799675)
    );

    var options = { bounds: defaultBounds, componentRestrictions: { country: 'BR' } };
    var input = document.getElementById('searchTextField');
    var inputEnd = document.getElementById('searchTextFieldEnd');

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    var autocompleteEnd = new google.maps.places.Autocomplete(inputEnd, options);
    

    $scope.bindAutocompleteTo(autocomplete, 0);
    $scope.bindAutocompleteTo(autocompleteEnd, 1);
      
  }


  $scope.bindAutocompleteTo = function(object, index) {
    google.maps.event.addListener(object, 'place_changed', function(){

      var place = object.getPlace();
      var lat = place.geometry.location.k;
      var lng = place.geometry.location.D;
     
      
      // latitude, longitude
      if (index == 0) {
        $scope.showMarkerOnAutocomplete(lat, lng);
      }
      $scope.updateDemandPins(lat, lng, index); 



      $scope.demand.pins[index].fullname = place.formatted_address;

  
      $scope.pins.push($scope.toCoordinate($scope.demand.pins[index].lat, $scope.demand.pins[index].long));


      if ( index == 1 ) {
        $scope.markers.clearLayers()
        $scope.routeWaypoints().setWaypoints($scope.pins);
      }



    });


  }


  $scope.toCoordinate = function(lat, lng) {
    return L.latLng(lat, lng);
  }


  $scope.updateDemandPins = function(lat, lng, index) {
      $scope.demand.pins[index].lat = lat;
      $scope.demand.pins[index].long = lng;
      $scope.$apply();
  }


  $scope.showMarkerOnAutocomplete = function(lat, lng){

    var marker = L.marker([lat, lng], { icon: $scope.icon, draggable: true });

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
          $scope.demand.pins[0].fullname = results[1].formatted_address;
          $scope.$apply();

        }
      }
    
    });  
  }

  /**
   *
   * Waypoints & Routing Configuration
   *
   */
  
  $scope.addWaypoint = function() {
    $scope.showFinalWaypoint = true;
    $scope.routeWaypoints();
  }

  $scope.routeWaypoints = function(waypoint) {
     return L.Routing.control({
      waypoints: [
      ],
    }).addTo($scope.map);

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

