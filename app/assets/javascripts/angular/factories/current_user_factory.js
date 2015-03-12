demandsApp.factory('currentUserFactory', ['$resource', function($resource){

  return { 
    currentUser: function() {
      return false;
    }
  }

}]);
