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
    update: ->
      $.ajax
        type: 'post',
        data: $('.tags').sortable('serialize'),
        dataType: 'script',
        complete: (request) ->
          $('#books').effect('highlight')
        url: '/characters/1/tags/sort'
