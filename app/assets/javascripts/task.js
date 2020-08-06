// $(function(){

//   if ($(".group-task").is(':hidden')) {
//     $(".calendar-content__start, .calendar-content__other").on('click', function(){
//       $(".group-task").fadeIn(10);
//       $(".group-top, .group-show-btn").animate({opacity:0.7}, {duration:10});
//       debugger
//     });
//   }
//   if ($(".group-task").is(':visible')) {
//     $(".group-top, .group-show-btn").on('click',  function(){
//       $(".group-task").fadeOut(10);
//       debugger
//     });
//   }
// })

// $(function(){
//     if ($(".calendar-clickevent").length) {
//       $(".calendar-clickevent").on('click', function(){
//         $(".group-task").fadeIn(10);
//         $(".group-top, .group-show-btn").animate({opacity:0.7}, {duration:10});
//         $(".calendar-content").removeClass('calendar-clickevent');
//         debugger
//         });
//     } else {
//       $(".group-top, .group-show-btn").on('click',  function(){
//       $(".group-task").fadeOut(10);
//       debugger
//       });
//     }
// });

$(function(){
  $(".calendar-content__start, .calendar-content__other").on('click', function(){
    if ($(".calendar-content").hasClass("calendar-clickevent")) {
      $(".group-task").fadeIn(10);
      $(".group-top, .group-show-btn").animate({opacity:0.7}, {duration:10});
      $(".calendar-content").removeClass('calendar-clickevent');
      debugger
      return false;
    }
  });

  $(".group-top, .group-show-btn").on('click',  function(){
    if ($(".calendar-content").not("calendar-clickevent")) {
      $(".group-task").fadeOut(10);
      $(".calendar-content").addClass('calendar-clickevent');
      debugger
    }
  });
})