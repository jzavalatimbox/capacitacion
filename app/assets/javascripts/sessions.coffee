# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
Paloma.controller 'Sessions',
  create: ->
    if(!this.params.auth)
      display_message 'Los valores ingresados no se encuentran en el sistema. Intentelo nuevamente', 'danger'
    return
  new: ->
    $(document).ready ->
      $('#validation_form').on 'submit', (e) ->
        fields = [
          '#session_email'
          '#session_password'
        ]
        if !validate_fields(fields)
          display_message 'Hay campos que son requeridos', 'danger'
          false
      return
    return
