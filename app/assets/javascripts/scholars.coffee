formatItem = (item) ->
  if item.loading
    "Searching..."
  else
    '<span class=\'select2-result-repository__title\'>' + item.name + ' ' + '<small class=\'text-muted\'>' + item.country + '</small>' +'</span>'

formatItemSelection = (item) ->
  '<span class=\'select2-result-repository__title\'>' + item.name + ' ' + '<small class=\'text-muted\'>' + item.country + '</small>' +'</span>'

$(document).on "ready page:load remote:load turbolinks:load", ->

  $(".web_urls").each ->
    $(".remove_fields").addClass("invisible") if $(@).find(".post_quantity").length < 2

    $(@).on
      "cocoon:before-insert": (e, task_to_be_added) ->
        task_to_be_added.fadeIn 300

  $("select[name*='scholar[discipline_id]']").select2
    placeholder: ""

  # $("select[name*='scholar[institute_token]']").select2
  $("select.world_universities").select2
    minimumInputLength: 3
    dataType: 'json'
    ajax:
      url: "/world_universities"
      data: (params) ->
        query = {name: params.term}
      processResults: (data, params) ->
        results: data
    escapeMarkup: (markup) -> markup
    templateResult: formatItem
    templateSelection: formatItemSelection

  $("form#scholar-form").submit (ev) ->
    uni = $(@).find("select.world_universities").select2("data")[0]
    if uni
      $(@).find("input[name$='[institute_token]']").val "#{uni.name},#{uni.country}"
