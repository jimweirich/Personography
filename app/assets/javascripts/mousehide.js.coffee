$ ->
  $(".mousehide .link").hide()
  $(".mousehide").mouseenter -> $(@).find(".link").show()
  $(".mousehide").mouseleave -> $(@).find(".link").hide()
