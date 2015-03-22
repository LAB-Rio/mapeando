'use strict';


describe('demandsController', function(){
  var $httpBackend;
  var $rootScope;
  var scope;
  var demandFactoryMock;
  var mapFactoryMock;
  var demandRequestHandler;
  var categoryRequestHandler;

  beforeEach(angular.mock.module('demandsApp'));


  // Mocking factories needed by the controller
  beforeEach(module('demandsApp', function($provide){
    mapFactoryMock = {
      buildMap: jasmine.createSpy()
    };
    
    $provide.value('mapFactory', mapFactoryMock);
  }));


  // Mocking all controller dependencies/functions
  beforeEach(angular.mock.inject(function($rootScope, $controller, $injector){
  
    $httpBackend  = $injector.get('$httpBackend');
    $rootScope    = $injector.get('$rootScope');

    scope = $rootScope.$new();

    $httpBackend.when('GET', 'assets/demands/index.html').respond('<div></div>');

    categoryRequestHandler =  $httpBackend.when('GET', '/categories?format=json').respond({});
    demandRequestHandler =    $httpBackend.when('GET', '/demands?format=json').
      respond({ demands: [ {
       id: 1,
       fullname: 'Comment',
       user_id: 1,
       category_id: 1,
       category: { name: 'X', travel_mode: 'Y', icon_url: 'XX'},
       pins: [ { lat: '1', long: '2', fullname: 'Rio'} ],
       user: { first_name: 'X', last_name: 'Y', avatar: 'XX', district: 'Lapa' }
      } ]});


    $controller('demandsController', { $scope: scope });


    // Spy initializer function
    spyOn(scope, 'initialize').and.callThrough();
    spyOn(scope, 'loadDemands').and.callThrough();
    spyOn(scope, 'showDemandsOnMap').and.callThrough();
  

    var initializer = scope.initialize();
  }));

  
/*   afterEach(function() {*/
     //$httpBackend.verifyNoOutstandingExpectation();
     //$httpBackend.verifyNoOutstandingRequest();
   /*});*/


  it('should call the initializer function', function(){
    expect(scope.initialize).toHaveBeenCalled();
  });

  it('should instantiate a new leaflet map', function(){
    expect(mapFactoryMock.buildMap).toHaveBeenCalledWith('map');
  });

  it('should load demands JSON', function(){
    expect(scope.loadDemands).toHaveBeenCalledWith({});
  });

  it('should load categories JSON', function(){
    $httpBackend.expectGET('/categories?format=json');
    $httpBackend.flush();
    expect(scope.categories).toEqual(categoryRequestHandler);
  });


  it('should make a request to get all demands', function(){
    $httpBackend.expectGET('/demands?format=json');
    $httpBackend.flush();
    expect(scope.showDemandsOnMap).toHaveBeenCalledWith(demandRequestHandler);
  });


        
});
