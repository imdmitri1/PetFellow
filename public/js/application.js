$(document).ready(function() {

  // enlarge photo on main page
 $('img').on('click', function(){
   var $parent = $(this).parent();
   var moda = $parent.find('.myModa');
   var modaImg = moda.find('img');
   var captionText = $parent.find('.caption');
   moda.css("display", "block");
   modaImg.attr('src', $(this).attr('src'));
   captionText.html($parent.parent().find('.info').html()).addClass('caption-color');
 })
 $('body').on('click','.moda', function(){
   $(this).css("display", "none");
 })

  // add min body height:
 $('.main-cont').css("min-height",window.innerHeight - 105)
 $( window ).resize(function() {
   $('.main-cont').css("min-height",window.innerHeight - 105)
 });
 $('.main-cont2').css("min-height",window.innerHeight)
 $( window ).resize(function() {
   $('.main-cont').css("min-height",window.innerHeight)
 });

  // ajax
  if (docCookies.getItem("user")){
      // ajaxifying likes
    $('.col, .alike').on('click','button.fho', function(event){
      event.preventDefault();
      $this = $(this);
      var link = $this.parent().attr('action');
      $this.find('i').removeClass('fa-heart-o').addClass('fa-heart');
      $this.removeClass('fho').addClass('fh');
      $this.closest('.row').find('.like-count').addClass('greyColor');
      $.ajax({
        url: link,
        type: "Post"
      })
      .done(function(response){
        $this.closest('.row').find('.like-count').removeClass('greyColor');
        $this.closest('.row').find('.like-count').text(response);
      });
    });

    $('.col, .alike').on('click','button.fh', function(event){
      event.preventDefault();
      $this = $(this);
      var link = $this.parent().attr('action');
      $this.find('i').removeClass('fa-heart').addClass('fa-heart-o');
      $this.removeClass('fh').addClass('fho');
      $this.closest('.row').find('.like-count').addClass('greyColor');
      $.ajax({
        url: link,
        type: "Post"
      })
      .done(function(response){
        $this.closest('.row').find('.like-count').removeClass('greyColor');
        $this.closest('.row').find('.like-count').text(response);
      });
    });

    // ajaxifying favorites
    $('.col').on('click','button.fso', function(event){
      event.preventDefault();
      $this = $(this);
      var link = $this.parent().attr('action');
      var post_id = {"post_id": $this.siblings('input').attr('value')};
      $this.find('i').removeClass('fa-star-o').addClass('fa-star');
      $this.removeClass('fso').addClass('fs');
      $.ajax({
        url: link,
        type: "Post",
        data: post_id
      });
    });

    $('.col').on('click','button.fs', function(event){
      event.preventDefault();
      $this = $(this);
      var link = $this.parent().attr('action');
      var post_id = {"post_id": $this.siblings('input').attr('value')};
      $this.find('i').removeClass('fa-star').addClass('fa-star-o');
      $this.removeClass('fs').addClass('fso');
      $.ajax({
        url: link,
        type: "Post",
        data: post_id
      });
    });
  };

});
