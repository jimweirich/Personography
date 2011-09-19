$ ->
  $( ".sortable" ).sortable();
  $( ".sortable" ).disableSelection();

  $('.sortable').sortable
    axis: 'y',
    dropOnEmpty: false,
    handle: '.handle',
    cursor: 'crosshair',
    items: 'li',
    opacity: 0.4,
    scroll: true,
    update: (event, view) ->
      $.ajax
        type: 'post',
        data: $(event.srcElement).parents('.sortable').sortable('serialize'),
        dataType: 'script',
        complete: (request) ->
          $(event.srcElement).parents('.sortable').effect('highlight')
        url: $(event.srcElement).parents('.sortable').sortable('widget').attr('xurl')
