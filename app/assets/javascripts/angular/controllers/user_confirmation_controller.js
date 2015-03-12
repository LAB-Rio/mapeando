controllers.controller('userConfirmationController', [
  '$scope', '$route', '$location', 'accountFactory', 
  function($scope, $route, $location, accountFactory){

  $scope.confirmationError = false;
  $scope.confirmationSuccess = false;
  $scope.token = $route.current.params.token;

  $scope.initialize = function() {
    $scope.getTokenConfirmation();
  }


  $scope.getTokenConfirmation = function(){
    accountFactory.confirmAccount({ confirmation_token: $scope.token }, function(response){
        $scope.confirmationSuccess = true;

    }, function(response_error) { 
      $scope.confirmationError = true;
      $scope.confirmationErrorMessage = response_error.data['confirmation_token'];
    }); 
  }


  $scope.initialize();

}]);
