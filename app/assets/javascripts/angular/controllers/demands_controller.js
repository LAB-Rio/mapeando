controllers.controller('demandsController', [
  '$scope', 'mapFactory', 'demandFactory', 'categoryFactory', '$http', '$q', 
  function($scope, mapFactory, demandFactory, categoryFactory, $http, $q){
 
  $scope.map, $scope.result, $scope.markers, $scope.layerGroup;
  $scope.categories = categoryFactory.index(); 

  $scope.initialize = function(){
    $scope.map = mapFactory.buildMap('map');
    $scope.loadDemands({});
  }


  $scope.showDemandsOnMap = function(demands) {
    $scope.markers = [];

    var size = demands.length;

    for (i = 0; i < size; i++) {


      if (demands[i].pins.length > 0) {

        var pin = demands[i].pins;
        var pin_size = demands[i].pins.length;

        for (index = 0; index < pin_size; index++) {

          
          var icon = L.icon({ iconUrl: pin[index].icon, iconSize: [22, 22]});

          marker = L.marker([pin[index].lat, pin[index].long], { icon: icon, riseOnHover: true }); 
          $scope.markers.push(marker);


          $scope.subscribeMarkerEvents(marker, demands[i]);


        }
      }
      
    }


    $scope.layerGroup = L.layerGroup($scope.markers).addTo($scope.map);
  }

  $scope.subscribeMarkerEvents = function(marker, demand) {

    $scope.setPopupContent(marker, demand, 'click');
    $scope.setPopupContent(marker, demand, 'mouseover');
   }


  $scope.setPopupContent = function(marker, demand, binding){

    marker.on(binding, function(event) {
      var html = '<div class="marker-view">';
      html += '<img src="' + demand.user.avatar + '" width="40" height="40"/>';
      html += '<h6><strong>' + demand.user.first_name + ' quer</strong> em ' + demand.pins[0].fullname + ' </h6>';
      html += '<div class="marker-content"><h5>'+ demand.category + '</h5>';
      html += '<blockquote>' + demand.fullname + '</blockquote></div>';
      html += '<p class="text-center"><a class="button" href="#/demands/show/'+ demand.id + '">Ver mais</a></p>';
      html += '</div>';
      marker.bindPopup(html).openPopup();   
    });
  }


  $scope.loadDemands = function(params) {
    demandFactory.index(params, function(response){
      $scope.showDemandsOnMap(response.demands);
    });
  }


  $scope.$on('$locationChangeStart', function(){
    $scope.map.remove();
  });

  
  $scope.categoryName = {
    driving: "Transporte Individual Motorizado",
    biking: "Transporte Individual não Motorizado",
    walking: "Deslocamento a pé",
    bus: "Transporte Coletivo",

  }


  $scope.loadMarkers = function(category_id) {
    demandFactory.index({by_category_id: category_id }, function(response) {
      $scope.map.removeLayer($scope.layerGroup);
      $scope.showDemandsOnMap(response.demands);
    });
  }


  $scope.initialize();


}]);
