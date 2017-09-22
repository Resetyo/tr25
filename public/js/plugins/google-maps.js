function initialize() {[,]
  var myLatlng = new google.maps.LatLng(55.9661464,92.7248473);

  var styleArray = [
    {
      featureType: 'all',
      stylers: [
        { saturation: -80 }
      ]
    },{
      featureType: 'road.arterial',
      elementType: 'geometry',
      stylers: [
        { hue: '#00ffff' },
        { saturation: 50 }
      ]
    },{
      featureType: 'poi.business',
      elementType: 'labels',
      stylers: [
        { visibility: 'off' }
      ]
    }
  ];

  var mapOptions = {
    zoom: 3,
    scrollwheel: false,
    center: myLatlng,
    styles: styleArray
  }
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var contentString = '<div>'+
        '<div>'+
        '</div>'+
        '<h1>Krasnoyarsk</h1>'+
        '<div>'+
        '<img src="/img/816737.jpg"></img>'+
        '</div>'+
        '</div>';

  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var image = '/img/home.png';
  var beachMarker = new google.maps.Marker({
    position: myLatlng,
    map: map,
    icon: image,
    title: "I'm living here"
  });
  beachMarker.addListener('click', function() {
    infowindow.open(map, beachMarker);
  });
}

google.maps.event.addDomListener(window, 'load', initialize);