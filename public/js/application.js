$(document).ready(function() {

  // scroll massege page to bottom:
  // $('#output-form').load(function(){
  //   $('html,body').animate({scrollTop: document.body.scrollHeight},"slow");
  // })
  // $('.textarea-border').scrollTop(300)

 $('img').on('click', function(){
   var $parent = $(this).parent();
   var moda = $parent.find('.myModa')
   var modaImg = moda.find('img')
   var captionText = $parent.find('.caption')
   moda.css("display", "block");
   modaImg.attr('src', $(this).attr('src'))
   captionText.html($parent.parent().find('.info').html()).addClass('caption-color');

 })

 $('body').on('click','.close', function(){
   $(this).parent().css("display", "none");
 })

 $('.container.body').css("min-height",window.innerHeight - 30)

});
