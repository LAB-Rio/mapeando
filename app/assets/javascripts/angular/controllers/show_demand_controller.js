controllers.controller('showDemandController', ['$scope', '$route', 'demandFactory', 'mapFactory', 'ezfb', '$location', function($scope, $route, demandFactory, mapFactory, ezfb, $location){
 
  $scope.map = mapFactory.buildMap('mini-map');
  $scope.pageUrl = $location.absUrl();
  $scope.demand;

  $scope.initialize = function() {
    $scope.loadDemand();
    ezfb.init();
   

  }

  $scope.setDemand = function(demand) {
    $scope.demand = demand;
  }


  $scope.setPins = function(pin) {
    $scope.pin    = pin; 
    var icon_url  = $scope.demand.category.icon_url;
    var icon      = L.icon({iconUrl: icon_url, iconSize: [26,26]});
    var marker    = L.marker([$scope.pin.lat, $scope.pin.long], { icon: icon, riseOnHover: true })

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
