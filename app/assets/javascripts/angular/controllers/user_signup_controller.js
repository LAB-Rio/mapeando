controllers.controller("userSignupController", ['$scope', '$location', 'Auth', 'districtFactory', function($scope, $location, Auth, districtFactory){

  $scope.user;
  $scope.avatar = "http://i.imgur.com/8QrR1AH.png";
  $scope.showAvatarList = false;
  

  $scope.loginError = false;
  $scope.loginErrorMessage = '';

  $scope.districts = districtFactory.index();


  $scope.setAvatar = function(index) {
    var avatar_list = [
     "http://i.imgur.com/8QrR1AH.png",
     "http://i.imgur.com/IRyJj1Z.png",
     "http://i.imgur.com/Cwswft7.png",
     "http://i.imgur.com/kCCo23M.png",
    ];

    $scope.avatar = avatar_list[index];
    $scope.showAvatarList = false;
  }



  $scope.registerUser = function() {
    var user = $scope.user;
    var avatar = $scope.avatar;

    var credentials = {
      first_name: user.first_name,
      last_name: user.last_name,
      email: user.email,
      district_id: user.district_id,
      password: user.password,
      password_confirmation: user.password_confirmation,
      avatar: avatar 

    }

    Auth.register(credentials).then(function(user){
      console.log(user); 
    }, 
    function(error){
      
      $scope.loginError = true;

      angular.forEach(error.data['errors'], function(value, key) {
        $scope.loginErrorMessage += key + ' ' +  value;
      });
    
    });

  }


  $scope.$on('devise:new-registration', function(event, user){

    $location.path('/user/confirmation');
  
  });


}]);
