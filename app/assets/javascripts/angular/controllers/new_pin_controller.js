controllers.controller('newPinController', ['$scope', 'demandFormFactory', '$location', function($scope, demandFormFactory, $location){


  $scope.demand = demandFormFactory;

  $scope.nextStep = function() {
    $location.path('/demands/new/pins/edit'); 
  }


}]);
