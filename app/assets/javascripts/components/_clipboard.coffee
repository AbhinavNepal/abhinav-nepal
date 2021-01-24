$(document).on "remote:load turbolinks:load", ->

  for element in ["modal", null]
    container = if element? then {container: document.getElementById(element)} else {}
    clipboard = new ClipboardJS(".btn:not(:disabled)", container)

    clipboard.on "success", (e) ->
      $btn = $(e.trigger)
      $btn.prop("disabled", true).css("pointer-events", "none").text "Copied!"
      $btn.closest("span").attr("data-original-title", $btn.data("clipboard-title")).tooltip "show"
