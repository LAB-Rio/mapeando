controllers.controller('demandsController', ['$scope', 'mapFactory', 'demandFactory', '$http', '$q', function($scope, mapFactory, demandFactory, $http, $q){
 
  $scope.map, $scope.result;

  $scope.initialize = function(){
    $scope.map = mapFactory.buildMap();
    $scope.loadDemands();
  }


  $scope.showDemandsOnMap = function(demands) {
    var markers = [];

    var size = demands.length;
    var icon = L.icon({ iconUrl: 'http://i.imgur.com/73DJGd1.png', iconSize: [30, 41]});

    for (i = 0; i < size; i++) {


      if (demands[i].pins.length > 0) {

        var pin = demands[i].pins;
        var pin_size = demands[i].pins.length;

        for (index = 0; index < pin_size; index++) {
          marker = L.marker([pin[index].lat, pin[index].long], { icon: icon }); 
          markers.push(marker);
        }
      }
      
    }


    var group = L.layerGroup(markers).addTo($scope.map);
  }


  $scope.loadDemands = function() {
    demandFactory.index({}, function(response){
      $scope.showDemandsOnMap(response.demands);
    });
  }



  $scope.initialize();


}]);
