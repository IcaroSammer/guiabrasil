$( document ).on('turbolinks:load', function() {
  $cepHotelInput            = $('#hotel_establishment_attributes_cep')
  $cepRestaurantInput       = $('#restaurant_establishment_attributes_cep')
  $cepTouristAtractionInput = $('#tourist_attraction_establishment_attributes_cep')
  

  if($cepHotelInput.lenght !== 0){
    $cepHotelInput.focusout(function(e) {
      getAddressInfos(e, "hotel")
    });
  }

  if($cepRestaurantInput.lenght !== 0){
    $cepRestaurantInput.focusout(function(e) {
      getAddressInfos(e, "restaurant" )
    });
  }

  if($cepTouristAtractionInput.lenght !== 0){
    $cepTouristAtractionInput.focusout(function(e) {
      getAddressInfos(e, "touristAttraction" )
    });
  }


})  

function getAddressInfos(e, cepType) {
  $.ajax({
    url: '/user/establishments/address-infos?cep=' + e.target.value,
    type: 'POST',
  })
  .done(function(response) {
    if (cepType === "hotel") { 
      insertResponseOnHotelInputs(response)
    }else if (cepType === "restaurant"){
      insertResponseOnRestaurantInputs(response)
    }else{
      insertResponseOnTouristAttractionInputs(response)
    }

  })
  .fail(function() {
    alert('CEP não encontrado, tente novamente!')
  })
}

function insertResponseOnHotelInputs(response) {
  $('#hotel_establishment_attributes_address').val(response.address);
  $('#hotel_establishment_attributes_state').val(response.state);
  $('#hotel_establishment_attributes_city').val(response.city);
  $('#hotel_establishment_attributes_neighborhood').val(response.neighborhood);
  var position = navigator.geolocation.getCurrentPosition();
  show_map(position);
  alert(position);
  function show_map(position) {
   latitude = position.coords.latitude;
   longitude = position.coords.longitude;
   $('#hotel_establishment_attributes_geolocalization').val(latitude + ',' + longitude);
 }
}

function insertResponseOnRestaurantInputs(response) {
  $('#restaurant_establishment_attributes_address').val(response.address);
  $('#restaurant_establishment_attributes_state').val(response.state);
  $('#restaurant_establishment_attributes_city').val(response.city);
  $('#restaurant_establishment_attributes_neighborhood').val(response.neighborhood);
  navigator.geolocation.getCurrentPosition(show_map);
  function show_map(position) {
   latitude = position.coords.latitude;
   longitude = position.coords.longitude;
   $('#restaurant_establishment_attributes_geolocalization').val(latitude + ',' + longitude);
 }
}

function insertResponseOnTouristAttractionInputs(response) {
  $('#tourist_attraction_establishment_attributes_address').val(response.address);
  $('#tourist_attraction_establishment_attributes_state').val(response.state);
  $('#tourist_attraction_establishment_attributes_city').val(response.city);
  $('#tourist_attraction_establishment_attributes_neighborhood').val(response.neighborhood);
  navigator.geolocation.getCurrentPosition(show_map);
  function show_map(position) {
   latitude = position.coords.latitude;
   longitude = position.coords.longitude;
   $('#tourist_attraction_establishment_attributes_geolocalization').val(latitude + ',' + longitude);
 }
}