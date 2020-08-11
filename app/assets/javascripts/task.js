$(function(){
  $('.group-task').on('click', function(e){
    e.stopPropagation();
  });

  $(".calendar-content__start, .calendar-content__other").on('click', function(){
    if ($(".calendar-content").hasClass("calendar-clickevent") && $(this).find('.calendar-content__task').next().is('.group-task')) {
      $(this).find('.group-task').fadeIn(10);
      $(".group-top, .group-show-btn:not(:has(.group-task))").animate({opacity:0.7}, {duration:10});
      $(".calendar-content").removeClass('calendar-clickevent');
      return false;
    }else if ($(".calendar-content").hasClass("calendar-clickevent") && $(this).children().text().length !== 2) {
      $(".group-task-new").fadeIn(10);
      $(".group-top, .group-show-btn").animate({opacity:0.7}, {duration:10});
      $(".calendar-content").removeClass('calendar-clickevent');
      return false;
    };
  });

  $(".group-top, .group-show-btn").on('click',  function(){
    if ($(".calendar-content").not("calendar-clickevent")) {
      $(".group-task, .group-task-new").fadeOut(10);
      $(".group-top, .group-show-btn").animate({opacity:1}, {duration:10});
      $(".calendar-content").addClass('calendar-clickevent');
    };
  });

  $(".group-top__icon").on('click', function(){
    if ($(".arrow_box").is(':hidden')) {
      $(".arrow_box").fadeIn(10);
      return false
    }else {
      $(".arrow_box").fadeOut(10);
    }
  });

  $('.group-task__btn__delete').on('click', function(e){
    if (window.confirm( '削除しますか？' ) == false) {
      e.preventDefault();
    }
  });
});