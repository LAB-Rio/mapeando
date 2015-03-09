controllers.controller('demandsController', ['$scope', 'mapFactory', 'demandFactory', '$http', '$q', function($scope, mapFactory, demandFactory, $http, $q){
 
  $scope.map, $scope.result;

  $scope.initialize = function(){
    $scope.map = mapFactory.buildMap();
    $scope.loadDemands();
  }


  $scope.showDemandsOnMap = function(demands) {
    var markers = [];

    var size = demands.length;

    for (i = 0; i < size; i++) {


      if (demands[i].pins.length > 0) {

        var pin = demands[i].pins;
        var pin_size = demands[i].pins.length;

        for (index = 0; index < pin_size; index++) {

          
          var icon = L.icon({ iconUrl: pin[index].icon, iconSize: [26, 26]});

          marker = L.marker([pin[index].lat, pin[index].long], { icon: icon, riseOnHover: true }); 
          markers.push(marker);


          $scope.subscribeMarkerEvents(marker, demands[i]);


        }
      }
      
    }


    var group = L.layerGroup(markers).addTo($scope.map);
  }


  $scope.subscribeMarkerEvents = function(marker, demand) {
    marker.on('click', function(event){
      marker.bindPopup('<p>Hello</p>').openPopup();
    });


    marker.on('mouseover', function(event) {
      var html = '<div class="marker-view">';
      html += '<h6>'+ demand.category + '</h6>';
      html += '<blockquote>' + demand.fullname + '</blockquote>';
      html += '<p class="text-right"><a class="button" href="#/demands/'+ demand.id + '">Ver mais</a></p>';
      html += '</div>';
      marker.bindPopup(html).openPopup();
    });
  }




  $scope.loadDemands = function() {
    demandFactory.index({}, function(response){
      $scope.showDemandsOnMap(response.demands);
    });
  }



  $scope.initialize();


}]);
