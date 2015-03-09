demandsApp.factory("demandFactory", ['$resource', function($resource) {
  return $resource("/demands/:id", { id: "@id", format: 'json' },
    {
      'index':   { method: 'GET', isArray: false },
      'show':    { method: 'GET', isArray: false }
    }
  );
}]);
