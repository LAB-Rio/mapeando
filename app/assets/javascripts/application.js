// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation/foundation
//= require magnific-popup
//= require_tree .

$(function(){ 
  $(document).foundation(); 
  $('.open-popup-window').magnificPopup();
  $('.pac-container').css('z-index', 9999);
});




window.App = {

  initialize: function(){
    this.myMap = new google.maps.Map(document.getElementById("map-canvas"), this.myOptions);
    this.setMapPins();
    this.setAutoComplete();
    //google.maps.event.addDomListener(window, 'load', App.initialize);

  },

  myOptions: {
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      zoom: 12,
      center: new google.maps.LatLng(-22.911589, -43.357264),
  },

  setAutoComplete: function(){
    var defaultBounds = new google.maps.LatLngBounds(
      new google.maps.LatLng(-22.911589, -43.797264),
      new google.maps.LatLng(-22.911589, -43.149070)
    );

    var options = { bounds: defaultBounds };
    var input = document.getElementById('searchTextField');

    var autocomplete = new google.maps.places.Autocomplete(input, options);
    


    google.maps.event.addListener(autocomplete, 'place_changed', function(){

      var latField = document.getElementById('searchLatField');
      var longField = document.getElementById('searchLongField');

      var place = autocomplete.getPlace();

      latField.value = place.geometry.location.k;
      longField.value = place.geometry.location.D;
    });

  },



  setMapPins: function(){
    var self = this;
    var map = window.App.myMap;
    for (i = 0; i < window.routesArray.length; i++) { 
      var marker = new google.maps.Marker({
        position: new google.maps.LatLng(window.routesArray[i].lat, window.routesArray[i].long),
        icon: window.routesArray[i].icon,
        map: map,
        title: window.routesArray[i].title
      });
    }



  },

};

window.App.initialize();
