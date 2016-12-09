$(document).ready(function(){
  $(".index-sorts").children().hide()
  $("table").eq(0).show()
  $("div > ul > li").click(function(){
    var position = $(this).index()
    $(".index-sorts").children().hide()
    $("table").eq(position).toggle()
  })
})
