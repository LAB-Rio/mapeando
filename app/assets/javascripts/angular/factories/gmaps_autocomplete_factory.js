demandsApp.factory('GmapsAutocompleteFactory', ['$resource', function($resource){

  return { 
    
    setup: function(elemId) {
      var defaultBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(-23.0763561, -43.7959671),
        new google.maps.LatLng(-22.7259989, -43.0799675)
      );

      var options = { bounds: defaultBounds, componentRestrictions: { country: 'BR' } };
      var input = document.getElementById(elemId);

      var autocomplete = new google.maps.places.Autocomplete(input, options);
      
      return autocomplete;
    }

  }


}]);
