demandsApp.factory('districtFactory', ['$resource', function($resource){
  return $resource("/districts/:id", { id: "@id", format: 'json' },
    {
      'index':   { method: 'GET', isArray: false },
      'show':    { method: 'GET', isArray: false }
    }
  );

}])
