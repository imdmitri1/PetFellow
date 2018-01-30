$(document).ready(function() {

 $('img').on('click', function(){
   var $parent = $(this).parent();
   var moda = $parent.find('.myModa');
   var modaImg = moda.find('img');
   var captionText = $parent.find('.caption');
   moda.css("display", "block");
   modaImg.attr('src', $(this).attr('src'));
   captionText.html($parent.parent().find('.info').html()).addClass('caption-color');

 })

 $('body').on('click','.close', function(){
   $(this).parent().css("display", "none");
 })

  // add min body height:
 $('.main-cont').css("min-height",window.innerHeight - 105)
 $( window ).resize(function() {
   $('.main-cont').css("min-height",window.innerHeight - 105)
 });

  // ajaxifying likes
  $('button').on('click','.fa-heart-o', function(event){
    event.preventDefault();
    $this = $(this).parent();
    var link = $this.parent().attr('action');
    $.ajax({
      url: link,
      type: "Post"
    })
    .done(function(response){
      $this.find('i').removeClass('fa-heart-o').addClass('fa-heart');
      $this.closest('.row').find('.like-count').text(response);
    });
  });

  $('button').on('click','.fa-heart', function(event){
    event.preventDefault();
    $this = $(this).parent();
    var link = $this.parent().attr('action');
    $.ajax({
      url: link,
      type: "Post"
    })
    .done(function(response){
      $this.find('i').removeClass('fa-heart').addClass('fa-heart-o');
      $this.closest('.row').find('.like-count').text(response);
    })
  });

  // $('.fa.fa-star-o').parent().on('click', function(event){
  //   event.preventDefault();
  //   console.log($(this).parent().attr('action'))
  // });
  //
  // $('.fa.fa-star').parent().on('click', function(event){
  //   event.preventDefault();
  //   console.log($(this).parent().attr('action') + "!!!")
  // });



});
