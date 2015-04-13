controllers.controller('userProfileController', ['$scope', '$route' , 'userFactory', function($scope, $route, userFactory){
  

  $scope.initialize = function() {
    $scope.user = userFactory.show({ id: $routeParams.id })
  }


  $scope.initialize();

}]);
