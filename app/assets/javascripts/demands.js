demandsApp = angular.module('demandsApp', [
  'angular-loading-bar',
  'angular.filter',
  'ezfb',
  'controllers', 
  'ngAnimate', 
  'ngRoute', 
  'ngResource',
  'Devise',
  'angulartics',
  'angulartics.google.analytics',
]);

demandsApp.config(['$routeProvider', '$locationProvider', 'ezfbProvider', function($routeProvider, $locationProvider, ezfbProvider){
  $routeProvider
    .when('/',                  { templateUrl: 'assets/demands/index.html', controller: 'demandsController' })
    .when('/demands/new',       { templateUrl: 'assets/demands/new.html', controller: 'newDemandController' })
    .when('/demands/new/pins',  { templateUrl: 'assets/pins/new.html', controller: 'newPinController' })
    .when('/demands/create',    { templateUrl: 'assets/demands/create.html', controller: 'createDemandController' })
    .when('/demands/new/pins/edit', { templateUrl: 'assets/pins/edit.html', controller: 'editPinController' })
    .when('/demands/show/:id',      { templateUrl: 'assets/demands/show.html', controller: 'showDemandController' })
    .when('/about',                 { templateUrl: 'assets/pages/about.html' })
    .when('/login',                 { templateUrl: 'assets/users/login.html', controller: 'userLoginController' })
    .when('/user/confirmation',     { templateUrl: 'assets/users/confirmation.html' })
    .when('/user/confirmation/:token',  { templateUrl: 'assets/users/confirmation.html', controller: 'userConfirmationController' })
    .when('/signup',                    { templateUrl: 'assets/users/signup.html', controller: 'userSignupController' })
    .when('/logout',                    { templateUrl: 'assets/users/logout.html', controller: 'userSessionLogoutController' });

  ezfbProvider.setLocale('pt_BR');

  //$locationProvider.html5Mode(true); 
}]);



controllers = angular.module('controllers', []);
