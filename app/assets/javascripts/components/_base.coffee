$(document).on "turbolinks:load", ->
  # init tooltips
  $('[data-toggle="tooltip"]').tooltip()
  # default select2 theme
  $.fn.select2.defaults.set( "theme", "bootstrap" )

document.addEventListener "turbolinks:before-cache", ->
  # clear placeholder before caching
  # https://github.com/ambethia/recaptcha/issues/217
  $("form .g-recaptcha").empty()
  # destroy all select2 objects before caching as
  # its not attached when using turbolinks
  $("form select.select2-hidden-accessible").select2("destroy")
