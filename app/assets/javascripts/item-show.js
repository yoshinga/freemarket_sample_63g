$(document).on('turbolinks:load', function() {
  $("img.change-photo").hover(function(){
    var ImgSrc = $(this).attr("src");
    var ImgAlt = $(this).attr("alt");
    $("#main-photo").attr({src:ImgSrc,alt:ImgAlt});
    $("#main-photo").hide();
    $("#main-photo").fadeIn(0);
    return false;
  });
});
