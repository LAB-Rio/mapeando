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



    if ($scope.pin.length == 1) {
      var pin = $scope.pin[0];
      var marker    = L.marker([pin.lat, pin.long], { icon: icon, riseOnHover: true })

      $scope.map.setView([pin.lat, pin.long], 15);
      marker.addTo($scope.map);
      marker.bindPopup(pin.fullname).openPopup();
    

    } else {

      var points = [];
      console.log($scope.pin);
      for (var i = 0; i < $scope.pin.length; i++) {
        points.push(L.latLng($scope.pin[i].lat, $scope.pin[i].long));
  
      }

      $scope.routingControl = L.Routing.control({ 
        waypoints: points, 
        show: false,
        containerClassName: 'show-demand-page',
        router: new L.Routing.GraphHopper('073f0aa6-81cc-4e64-875c-aec614615a51', { 
          vehicle: 'foot', locale: 'pt_BR' 
        }),
      }).addTo($scope.map); 

      $scope.map.setView([$scope.pin[0].lat, $scope.pin[0].long], 16);
    }

    
  }


  $scope.loadDemand = function() {
   demandFactory.show({id: $route.current.params.id }, function(response){
    $scope.setDemand(response.demand);
    $scope.setPins(response.demand.pins);
   });
  }


  $scope.initialize();



}]);
