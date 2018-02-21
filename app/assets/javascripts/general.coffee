@validate_fields = (fields) ->
  valid_form = true
  x = 0
  while x < fields.length
    $(fields[x]).removeClass 'invalid'
    if $(fields[x]).val() == ''
      $(fields[x]).addClass 'invalid'
      valid_form = false
    else if !$(fields[x]).val()
      $(fields[x]).addClass 'invalid'
      valid_form = false
    x++
  valid_form

@display_message = (message, type) ->
  $('#flash_messages').removeClass()
  $('#flash_messages').addClass 'alert'
  $('#flash_messages').addClass 'alert-' + type
  $('#flash_messages').html message
  return
