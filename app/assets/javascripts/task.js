$(function(){
  $('.group-task').on('click', function(e){
    e.stopPropagation();
  });

  $(".calendar-content__start, .calendar-content__other").on('click', function(){
    if ($(".calendar-content").hasClass("calendar-clickevent") && $(this).find('.calendar-content__task').next().is('.group-task')) {
      console.log($(this).find('.calendar-content__task').next('group-task'))
      $(this).find('.group-task').fadeIn(10);
      $(".group-top, .group-show-btn").animate({opacity:0.7}, {duration:10});
      $(".calendar-content").removeClass('calendar-clickevent');
      return false;
    };
  });

  $(".group-top, .group-show-btn").on('click',  function(){
    if ($(".calendar-content").not("calendar-clickevent")) {
      $(".group-task").fadeOut(10);
      $(".group-top, .group-show-btn").animate({opacity:1}, {duration:10});
      $(".calendar-content").addClass('calendar-clickevent');
    };
  });
});