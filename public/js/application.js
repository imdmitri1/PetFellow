$(document).ready(function() {

  // scroll massege page to bottom:
  // $('#output-form').load(function(){
  //   $('html,body').animate({scrollTop: document.body.scrollHeight},"slow");
  // })
  // $('.textarea-border').scrollTop(300)

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

 // make page min-height the height of the window
 // $('.container.body').css("min-height",window.innerHeight - 30)

  // ajaxifying likes
  // $('.fa.fa-heart-o').parent().on('click', function(event){
  //   event.preventDefault();
  //   console.log($(this).parent().attr('action'))
  // });
  //
  // $('.fa.fa-heart').parent().on('click', function(event){
  //   event.preventDefault();
  //   console.log($(this).parent().attr('action') + "!!!")
  // });
  //
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
