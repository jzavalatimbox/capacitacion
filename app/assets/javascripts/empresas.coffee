# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Paloma.controller 'Empresas',
  new: ->
    $(document).ready ->
      $('#validation_form').on 'submit', (e) ->
        fields = [
          '#empresa_nombre_completo'
          '#empresa_nombre_empresa'
          '#empresa_email'
          '#empresa_rfc'
          '#password_input'
          '#password_confirmation'
        ]
        if !validate_fields(fields)
            display_message 'Hay campos que son requeridos', 'danger'
            false
        else
          if ($('#password_input').val() != $('#password_confirmation').val())
            $('#password_input').addClass 'invalid'
            $('#password_confirmation').addClass 'invalid'
            display_message 'Las contrasenas no coinciden', 'danger'
            false
      return
    return
