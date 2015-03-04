controllers.controller('NewDemandController', [
  '$scope', '$location', '$resource', '$route', 'categoryFactory', 
  function($scope, $location, $resource, $route, categoryFactory){

 
  $scope.isIssue, $scope.isDemand = false;
  
  $scope.initialize = function(){
    
    $scope.setDemandTypes();
    $scope.categories = categoryFactory.index();
  }


  $scope.setDemandTypes = function() {
    var current_param = $route.current.params.type;
    var current_type = ( current_param != undefined) ? current_param : 'demand';

    $scope.isIssue    = !(current_type == 'demand');
    $scope.isDemand   = !(current_type == 'issue');
  }


  
  $scope.initialize();


}]);

