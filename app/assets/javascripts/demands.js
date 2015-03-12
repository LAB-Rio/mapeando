demandsApp = angular.module('demandsApp', [
  'angular-loading-bar',
  'templates', 
  'controllers', 
  'ngAnimate', 
  'ngRoute', 
  'ngResource',
  'Devise'
]);

demandsApp.config(['$routeProvider', '$locationProvider', function($routeProvider, $locationProvider){
  $routeProvider
    .when('/', { templateUrl: 'demands/index.html', controller: 'demandsController' })
    .when('/demands/new',{ templateUrl: 'demands/new.html', controller: 'newDemandController' })
    .when('/demands/new/pins', { templateUrl: 'pins/new.html', controller: 'newPinController' })
    .when('/demands/create', { templateUrl: 'demands/create.html', controller: 'createDemandController' })
    .when('/demands/new/pins/edit', { templateUrl: 'pins/edit.html', controller: 'editPinController' })
    .when('/demands/show/:id',{ templateUrl: 'demands/show.html', controller: 'showDemandController' })
    .when('/login', { templateUrl: 'users/login.html', controller: 'userLoginController' })
    .when('/user/confirmation', { templateUrl: 'users/confirmation.html' })
    .when('/user/confirmation/:token', { templateUrl: 'users/confirmation.html', controller: 'userConfirmationController' })
    .when('/signup', { templateUrl: 'users/signup.html', controller: 'userSignupController' });


  //$locationProvider.html5Mode(true); 
}]);

controllers = angular.module('controllers', []);


