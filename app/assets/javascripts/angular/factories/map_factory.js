demandsApp.factory('mapFactory', ['$resource', function($resource){
  
  return { 
    buildMap: function() {
 
      var map = L.map('map', { 
        fullScreen: true, 
        scrollWheelZoom: false 
      }).setView([-22.9083, -43.2108], 13);


      var layer = L.tileLayer('http://{s}.tiles.mapbox.com/v4/luizfonseca.7532f8a3/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibHVpemZvbnNlY2EiLCJhIjoiMTFNcXRXdyJ9.5PRw57nx5srpwP838-KjVQ', {
        attribution: '&copy; LAB.Rio'
      });


      map.addLayer(layer);

      return map;
    },

    
  }

}]);
