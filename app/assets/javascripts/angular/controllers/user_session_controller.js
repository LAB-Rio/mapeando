controllers.controller('userSessionController', [
  '$scope', 'currentUserFactory', 'Auth', '$location', function($scope, currentUserFactory, Auth, $location){
    
  $scope.session = currentUserFactory;

    
  Auth.currentUser().then(function(user){
    $scope.currentUser = user.user;
    $scope.session.user = user.user;
  }, function(error){
    $scope.currentUser = false;
    $scope.session.user = false;
  });




  $scope.$on('devise:new-session', function(event, currentUser){
    $scope.currentUser = currentUser.user; 
    $scope.session.user = currentUser.user;
    var url = $scope.session.referrer || '/';
    
    $location.path(url);
  });

  $scope.$on('devise:logout', function(event, oldUser){
    $scope.currentUser = null;
  });


}]);
