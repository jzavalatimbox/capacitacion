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

Paloma.controller 'Sucursals',
  new: ->
    $(document).ready ->
      $('#validation_form').on 'submit', (e) ->
        fields = [
          '#sucursal_nombre'
        ]
        size = $(document).find('.nested_sucursal_empleados').length
        x = 0
        while x < size
          if $('#sucursal_empleados_attributes_' + x + '_nombre').parent().parent().parent().is(':visible')
            fields.push '#sucursal_empleados_attributes_' + x + '_nombre'
            fields.push '#sucursal_empleados_attributes_' + x + '_rfc'
          x++
        if !validate_fields(fields)
            display_message 'Hay campos que son requeridos', 'danger'
            false
      return
    return
  edit: ->
    $(document).ready ->
      $('#validation_form').on 'submit', (e) ->
        fields = [
          '#sucursal_nombre'
        ]
        if !validate_fields(fields)
            display_message 'Hay campos que son requeridos', 'danger'
            false
      return
    return
