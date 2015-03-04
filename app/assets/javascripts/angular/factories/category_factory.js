demandsApp.factory("categoryFactory", ['$resource', function($resource) {
  return $resource("/categories/:id", { id: "@id", format: 'json' },
    {
      'index':   { method: 'GET', isArray: false },
      'show':    { method: 'GET', isArray: false }
    }
  );
}]);
