navigator.geolocation.getCurrentPosition(function(position) {
  var location = {lat: position.coords.latitude, long: position.coords.longitude}
  var ajaxRequest = $.ajax({
    method: 'GET',
    url: '/',
    data: location})

});

$(document).on('turbolinks:load', function(){
  $(".index-sorts").children().hide()
  $('.index-categories').find('li').first().addClass('active')
  $("table").eq(0).show()
  $("div > ul > li").click(function(){
    var position = $(this).index()
    $("div > ul > li").removeClass('active')
    $(this).addClass('active')
    $(".index-sorts").children().hide()
    $("table").eq(position).toggle()
  })
})
