controllers.controller('demandsController', ['$scope', 'mapFactory', function($scope, mapFactory){
 


  $scope.initialize = function(){
    var map = mapFactory.buildMap();
  }

  $scope.initialize();


}]);
