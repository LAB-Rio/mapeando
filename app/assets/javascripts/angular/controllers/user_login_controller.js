controllers.controller("userLoginController", ['$scope', '$location', 'Auth' , function($scope, $location, Auth){


  $scope.user;
  $scope.credentials;
  $scope.loginError = false;
  $scope.loginErrorMessage = '';


  $scope.authenticateUser = function() {
    var user = $scope.user;
    var credentials = {
      email: user.email,
      password: user.password
    }



    Auth.login(credentials).then(function(user){
      $scope.loginErrorMessage = user;

    }, function(error) {
      $scope.loginError = true;
      $scope.loginErrorMessage = error.data['error'];
    });
  }


  $scope.$on('devise:login', function(event, currentUser){
     
  });



}]);
