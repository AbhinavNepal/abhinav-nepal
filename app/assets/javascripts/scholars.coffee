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

  $("form#scholar_search").each ->
    form = @

    $(form).find("select[name*='q[discipline_id_or_discipline_parent_id_eq]']").select2
      placeholder: "All disciplines"
      templateResult: (data) ->
        return data.text unless data.element
        $element = $(data.element)
        $wrapper = $("<span></span>")
        $wrapper.addClass($element[0].className).text(data.text)

    $(form).find("select[name*='q[discipline_id_or_discipline_parent_id_eq]']").on "change", ->
      Rails.fire(form, 'submit')
