$(document).ready(function() {

  // $('#output-form').on('load', function(){
  //   $('html,body').animate({scrollTop: document.body.scrollHeight},"slow");
  // })

 $('img').on('click', function(){
   // alert("hi")
   var $parent = $(this).parent();
   // console.log(parent)
   var moda = $parent.find('.myModa')
   // var img = $parent.find('.myImg')

   var modaImg = moda.find('img')


   // var captionText = $parent.find('.caption')

   moda.css("display", "block");
   modaImg.attr('src', $(this).attr('src'))

   // captionText.innerHTML = $(this).attr('alt');
   $('body').on('click','.close', function(){
     console.log("hi")
     $(this).parent().css("display", "none");
   })
 })






});


// Get the moda
// var moda = document.getElementById('myModa');
//
// // Get the image and insert it inside the moda - use its "alt" text as a caption
// var img = document.getElementById('myImg');
// var modaImg = document.getElementById("img01");
// var captionText = document.getElementById("caption");
//
//
// img.onclick = function(){
//     moda.style.display = "block";
//     modaImg.src = this.src;
//     captionText.innerHTML = this.alt;
// }
//
// // Get the <span> element that closes the moda
// var span = document.getElementsByClassName("close")[0];
//
// // When the user clicks on <span> (x), close the moda
// span.onclick = function() {
//     moda.style.display = "none";
// }
