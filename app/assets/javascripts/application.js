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
//= require angular
//= require angular-resource
//= require angular-route
//= require angular-animate
//= require angular-rails-templates
//= require angular-devise/devise
//= require angular-loading-bar
//= require angular-filter
//= require angular-easyfb
//
//= require demands
//= require_tree ./angular/factories
//= require_tree ./angular/controllers
//
//= require leaflet
//= require_tree ../templates
//= require_tree .




window.App = {

  initialize: function(){
/*    window.DemandsMap = L.map('map', { */
      //fullScreen: true, 
      //scrollWheelZoom: false 
    //}).setView([-22.9083, -43.2108], 13);


    //var layer = L.tileLayer('http://{s}.tiles.mapbox.com/v4/luizfonseca.7532f8a3/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibHVpemZvbnNlY2EiLCJhIjoiMTFNcXRXdyJ9.5PRw57nx5srpwP838-KjVQ', {
      //attribution: ''
    //});


    /*DemandsMap.addLayer(layer);*/


  },

  setAutoComplete: function(){
  },


  // TODO: migrate to LEAFLET
  //
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

