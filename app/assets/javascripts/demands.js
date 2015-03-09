demandsApp = angular.module('demandsApp', [
  'templates', 
  'controllers', 
  'ngAnimate', 
  'ngRoute', 
  'ngResource'
]);

demandsApp.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
  $routeProvider
    .when('/', { templateUrl: 'demands/index.html', controller: 'demandsController' })
    .when('/demands/new',{ templateUrl: 'demands/new.html', controller: 'newDemandController' })
    .when('/demands/new/pins', { templateUrl: 'pins/new.html', controller: 'newPinController' })
    .when('/demands/create', { templateUrl: 'demands/create.html', controller: 'createDemandController' })
    .when('/demands/new/pins/edit', { templateUrl: 'pins/edit.html', controller: 'editPinController' });


  //$locationProvider.html5Mode(true); 
}]);

controllers = angular.module('controllers', []);


