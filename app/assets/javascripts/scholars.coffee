scholars = new Bloodhound(
  datumTokenizer: Bloodhound.tokenizers.obj.whitespace("first_name")
  queryTokenizer: Bloodhound.tokenizers.whitespace
  prefetch: {url: Routes.scholars_path({format: "json"}), ttl: 21600000})
  # NOTE: remote - not a performant approach. prefer prefetch.
  # remote: {url: Routes.scholars_path({format: "json", q: {first_name_cont: 'QUERY'}}), wildcard: 'QUERY'}
# NOTE: Prefetched data cached for `21600000` (6hrs). debug/clear with:
# scholars.clearPrefetchCache();
scholars.initialize()

scholarOrgFields = ->
  $("select[name*='scholar[organisation_attributes][position]'], select[name*='scholar[organisation_attributes][country_code]']")

$(document).on "ready page:load remote:load turbolinks:load", ->

  $(".publication_web_urls, .personal_web_urls").each ->
    field1 = $(@).find(".web_url")[0]
    $(field1).find(".remove_fields").addClass("invisible")

    $(".web_url select").select2
      placeholder: ""

    $(@).on
      "cocoon:before-insert": (e, task_to_be_added) ->
        task_to_be_added.fadeIn 300
      "cocoon:after-insert": (e, added_task) ->
        added_task.find("select").select2
          placeholder: ""

  $("select[name*='scholar[discipline_id]']").select2
    placeholder: ""

  scholarOrgFields().select2
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

  $("input[name*='scholar[first_name]']").typeahead
    minLength: 3
    items: 10
    source: scholars.ttAdapter()
    autoSelect: false
    highlighter: Object
    subheader: "Existing scholars:"
    displayText: (data) ->
      return unless data
      return unless data.first_name
      "#{data.first_name} <small class='text-muted'> #{data.discipline}</small>"
    updater: (data) ->
      return unless data
      $("input#suggested_id").val(data.id)
      data.first_name # return
    afterSelect: (data) ->
      id = $("input#suggested_id").val()
      window.location.href = Routes.scholars_path({sid: id})

document.addEventListener "turbolinks:before-cache", ->
  # clear placeholder before caching
  # https://github.com/ambethia/recaptcha/issues/217
  $(".g-recaptcha").empty()
