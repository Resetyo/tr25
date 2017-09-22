$(document).ready(function() {
  $("#background_image").change(function() {
    $("#edit_background_1").submit();
  });

  $("body").on("change", ":file[id*=edit]", function() {
    $(this).parent().submit();  // Submits the form on change event
    $(this).parent().next("iframe").unbind().load(function() {
      result = JSON.parse($(this).contents().text());
      $(this).prev().find("img").attr("src", result.response.avatar.url);
    });
  });

  $("body").on("change", ":file[id$=0_image], :file[id=gallery_image]", function() {
    $(this).parent().submit();  // Submits the form on change event
    $(this).parent().next("iframe").unbind().load(function() {
      result = JSON.parse($(this).contents().text());
      $.ajax({
        type: "GET",
        url: "/new_or_update_gallery",
        data: { id: result.response.id},
      });
    });
  });
});

$(document).ready(function() {
  $("#carousel-example-generic .item:first-child").addClass("active");
});



$(document).ready(function() {
  var h_hdr = $('.tip-cloud').outerHeight();
  var h_hght = $('.welcome-classic__inner').outerHeight()-h_hdr;
  var top;
  $(window).scroll(function(){
      top = $(this).scrollTop();
      if(top < h_hght-h_hdr-50){
        $('.tip-cloud').css({'bottom': top+50 });
      }
      else if(top >= h_hght-h_hdr-50){
        $('.tip-cloud').css({'bottom': h_hght-h_hdr});
      }
  });
});