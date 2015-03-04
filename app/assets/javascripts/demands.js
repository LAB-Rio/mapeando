demandsApp = angular.module('demandsApp', [
  'templates', 
  'controllers', 
  'ngAnimate', 
  'ngRoute', 
  'ngResource',
  'categoryFactory'

]);

demandsApp.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
  $routeProvider
    .when('/', { templateUrl: 'demands/index.html', controller: 'DemandsController' })
    .when('/demands/new/:type',{ templateUrl: 'demands/new.html', controller: 'NewDemandController' });

  //$locationProvider.html5Mode(true); 
}]);

controllers = angular.module('controllers', []);


