$ ->
  $(".mousehide .as-needed").hide()
  $(".mousehide").mouseenter ->
    $(@).find(".as-needed").show()
    $(@).find(".as-unneeded").hide()
  $(".mousehide").mouseleave ->
    $(@).find(".as-needed").hide()
    $(@).find(".as-unneeded").show()
