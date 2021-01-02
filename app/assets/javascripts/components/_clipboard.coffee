$(document).on "remote:load turbolinks:load", ->

  clipboard = new ClipboardJS(".btn:not(:disabled)", container: document.getElementById("modal"))
  clipboard.on "success", (e) ->
    $btn = $(e.trigger)
    $btn.prop("disabled", true).css("pointer-events", "none").text "Copied!"
    $btn.closest("span").attr("data-original-title", $btn.data("clipboard-title")).tooltip "show"
