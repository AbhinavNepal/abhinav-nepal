$(document).on "ready page:load remote:load turbolinks:load", ->

  $(".web_urls").each ->
    $(".remove_fields").addClass("invisible") if $(@).find(".post_quantity").length < 2

    $(@).on
      "cocoon:before-insert": (e, task_to_be_added) ->
        task_to_be_added.fadeIn 300
