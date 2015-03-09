controllers.controller('showDemandController', ['$scope', '$route', 'demandFactory', 'mapFactory', function($scope, $route, demandFactory, mapFactory){
 
  $scope.map = mapFactory.buildMap('mini-map');
  $scope.demand;

  $scope.initialize = function() {
    $scope.loadDemand();
   

  }

  $scope.setDemand = function(demand) {
    $scope.demand = demand;
  }


  $scope.setPins = function(pin) {
    $scope.pin  = pin; 
    var icon    = L.icon({iconUrl: $scope.pin.icon, iconSize: [26,26]});
    var marker  = L.marker([$scope.pin.lat, $scope.pin.long], { icon: icon, riseOnHover: true })

    $scope.map.setView([$scope.pin.lat, $scope.pin.long], 15);
    marker.addTo($scope.map);
    marker.bindPopup(pin.fullname).openPopup();
    
  }


  $scope.loadDemand = function() {
   demandFactory.show({id: $route.current.params.id }, function(response){
    $scope.setDemand(response.demand);
    $scope.setPins(response.demand.pins[0]);
   });
  }


  $scope.initialize();



}]);
