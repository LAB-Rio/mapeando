controllers.controller('EditPinController', ['$scope', 'demandFormFactory', '$location', function($scope, demandFormFactory, $location){


  $scope.initialize = function() {
    $scope.setupAutoComplete();
  }

 

  $scope.setupAutoComplete = function() {
    var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-22.911589, -43.797264),
      new google.maps.LatLng(-22.911589, -43.149070)
    );

    var options = { bounds: defaultBounds };
    var input = document.getElementById('searchTextField');

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    


    google.maps.event.addListener(autocomplete, 'place_changed', function(){

      var latField = document.getElementById('searchLatField');
      var longField = document.getElementById('searchLongField');

      var place = autocomplete.getPlace();

      latField.value = place.geometry.location.k;
      longField.value = place.geometry.location.D;
    });

  }


  $scope.initialize();


}]);
