get_content = ->
  content = $(@).data("content-target")
  try # Ignore
    content = $(content).html()
  content or $(@).data("content")

$(document).on "remote:load turbolinks:load", ->

  $("[rel=popover]").popover
    title: $(@).data("title") or "",
    html: true,
    content: get_content,
    container: 'body'

  $("[rel=popover]").click (e) ->
    e.stopPropagation()
    e.preventDefault()

# http://jsfiddle.net/kAYyR/4/
# close popover if clicking outside of the popover of the close button
$(document).click (ev) ->
  if ($(".popover").has(ev.target).length is 0) or $(ev.target).is(".close")
    ev.preventDefault() if $(ev.target).is(".close")
    $("[rel=popover]").popover("hide")
