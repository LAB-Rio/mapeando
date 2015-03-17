controllers.controller('userSessionLogoutController', ['$scope','$location','Auth', 'currentUserFactory', function($scope, $location, Auth, currentUserFactory){
  

  Auth.logout().then(function(oldUser){
    currentUserFactory.user = null;
  }, function(err) {
    console.log(err);
  });



  $scope.$on('devise:logout', function(event, oldCurrentUser){
    $location.path('/');
  });
}]);
