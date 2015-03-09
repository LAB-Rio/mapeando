controllers.controller('showDemandController', ['$scope', '$route', 'demandFactory', function($scope, $route, demandFactory){
 
  $scope.demand = demandFactory.show({id: $route.current.params.id });

}]);
