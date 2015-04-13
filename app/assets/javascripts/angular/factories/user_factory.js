demandsApp.factory("userFactory", ['$resource', function($resource) {
  return $resource("/users/:id", { id: "@id", format: 'json' },
    {
      'index':   { method: 'GET', isArray: false },
      'show':    { method: 'GET', isArray: false }
    }
  );
}]);
