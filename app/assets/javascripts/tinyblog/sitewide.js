ready = function(){
  
  $('*[data-behaviour="hover_content"]').hide();  

  $('*[data-behaviour="has_hover_content"]').mouseenter(function(){  
    $(this).find('[data-behaviour="hover_content"]').show();
  }).mouseleave(function(){
    $(this).find('[data-behaviour="hover_content"]').fadeOut(50);
  });
}
  

$(document).ready(ready);
$(document).on('page:load', ready);


