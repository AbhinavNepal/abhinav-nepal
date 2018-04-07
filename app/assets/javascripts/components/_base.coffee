$(document).on "turbolinks:load", ->
  # init tooltips
  $('[data-toggle="tooltip"]').tooltip()
  # default select2 theme
  $.fn.select2.defaults.set( "theme", "bootstrap" )
