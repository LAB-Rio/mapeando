controllers.controller('newPinController', ['$scope', 'demandFormFactory', '$location', function($scope, demandFormFactory, $location){


  $scope.demand = demandFormFactory;


  $scope.initialize = function() {
    if (!$scope.demand.user) {
      $location.path('/demands/new');
    }
  }

  $scope.nextStep = function() {
    $location.path('/demands/new/pins/edit'); 
  }


  $scope.initialize();
}]);
