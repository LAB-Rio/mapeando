demandsApp.factory('accountFactory', ['$resource', function($resource){

  return $resource('/users/:action', { action: "@action", format: "json" }, 
    {
      'confirmAccount': { method: "GET", params: { action: 'confirmation' }, isArray: false }
    }
  );          
}]);
