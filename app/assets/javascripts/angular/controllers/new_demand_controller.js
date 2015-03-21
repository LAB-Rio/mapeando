controllers.controller('newDemandController', [
  '$scope', '$location', '$resource', '$route', 'categoryFactory', 'demandFormFactory', 'currentUserFactory', 
  function($scope, $location, $resource, $route, categoryFactory, demandFormFactory, currentUserFactory){

  $scope.isIssue, $scope.isDemand = false;
  $scope.demand = demandFormFactory;
  $scope.session = currentUserFactory;


  $scope.initialize = function(){


    if (!$scope.session.user) {
      $scope.session.referrer = '/demands/new';
      $location.path('/login');
    } else {
      $scope.demand.user = $scope.session.user;
    }

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




  $scope.initialize();


}]);

