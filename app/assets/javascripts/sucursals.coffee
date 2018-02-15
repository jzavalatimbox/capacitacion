# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "fields_added.nested_form_fields", (event, param) ->
  switch param.object_class
    when "empleado"
      if $(document).find('.nested_sucursal_empleados:visible').length == 6
        $(event.target).hide()
    else
      console.log "INFO: Fields were successfully added, callback not handled."
