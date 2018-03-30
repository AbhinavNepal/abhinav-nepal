$(document).on "ready page:load remote:load turbolinks:load", ->

  $(".web_urls").each ->
    $(@).find("input[name*='scholar[web_urls_attributes][0][_destroy]']").closest(".web_url").find(".remove_fields").addClass("invisible")

    $(@).on
      "cocoon:before-insert": (e, task_to_be_added) ->
        task_to_be_added.fadeIn 300

  $("select[name*='scholar[discipline_id]']").select2
    placeholder: ""

  $("select[name*='scholar[organisation_attributes][country_code]']").select2
    placeholder: ""
