demandsApp = angular.module('demandsApp', [
  'templates', 
  'controllers', 
  'ngAnimate', 
  'ngRoute', 
  'ngResource'
]);

demandsApp.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
  $routeProvider
    .when('/', { templateUrl: 'demands/index.html', controller: 'DemandsController' })
    .when('/demands/new',{ templateUrl: 'demands/new.html', controller: 'NewDemandController' })
    .when('/demands/new/pins', { templateUrl: 'pins/new.html', controller: 'NewPinController' })
    .when('/demands/new/pins/edit', { templateUrl: 'pins/edit.html', controller: 'EditPinController' });

  //$locationProvider.html5Mode(true); 
}]);

controllers = angular.module('controllers', []);


