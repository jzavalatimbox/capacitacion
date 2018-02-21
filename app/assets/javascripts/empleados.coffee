# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Paloma.controller 'Empleados',
  new: ->
    $(document).ready ->
      $('#validation_form').on 'submit', (e) ->
        fields = [
          '#empleado_sucursal_id'
          '#empleado_nombre'
          '#empleado_rfc'
        ]
        if !validate_fields(fields)
            display_message 'Hay campos que son requeridos', 'danger'
            false
      return
    return
  edit: ->
    $(document).ready ->
      $('#validation_form').on 'submit', (e) ->
        fields = [
          '#empleado_sucursal_id'
          '#empleado_nombre'
          '#empleado_rfc'
        ]
        if !validate_fields(fields)
            display_message 'Hay campos que son requeridos', 'danger'
            false
      return
    return
