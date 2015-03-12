controllers.controller('createDemandController', ['$scope', '$location', 'demandFormFactory', '$http', function($scope, $location, demandFormFactory, $http){

  $scope.demand = demandFormFactory;


  $scope.initialize = function() {

    if (!$scope.demand.user) {
      $location.path('/demands/new');
    }

    $scope.createDemand();
  }

  $scope.createDemand = function() {
    var demand = $scope.demand;

    $http.post('/demands/',
      {
        demand: {
          fullname: demand.fullname,
          category_id: demand.category_id,
          user_id: demand.user.id,
          pins_attributes: [{
            lat: demand.latitude,
            long: demand.longitude,
            fullname: demand.pin_fullname
          }]
        }
      }
    ).
      success(function(data, status, headers, config){
        $location.path('/');
    }).
      error(function(data, status, headers, config){
        alert();
    
    });
  }

  $scope.initialize();

}]);
