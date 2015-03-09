controllers.controller('newDemandController', [
  '$scope', '$location', '$resource', '$route', 'categoryFactory', 'demandFormFactory', 
  function($scope, $location, $resource, $route, categoryFactory, demandFormFactory){

  $scope.demand = demandFormFactory;
  $scope.isIssue, $scope.isDemand = false;



  $scope.initialize = function(){
    $scope.setDemandTypes();
    $scope.categories = categoryFactory.index();
  }



  $scope.nextStep = function() {
    $location.path('/demands/new/pins');
  }




  $scope.setDemandTypes = function() {
    var current_param = $route.current.params.type;
    $scope.paramType = ( current_param != undefined) ? current_param : 'demand';

    $scope.isIssue    = !($scope.paramType == 'demand');
    $scope.isDemand   = !($scope.paramType == 'issue');

    $scope.demand.issue = $scope.isIssue;
  }



  $scope.demandTypes = {
    issue: {
      header: 'Novo problema',
      category_header: 'O seu problema é sobre o quê?'
    },
    demand: { 
      header: 'Nova demanda',
      category_header: 'A sua ideia é sobre o quê?'

    }
  }


  $scope.initialize();


}]);

