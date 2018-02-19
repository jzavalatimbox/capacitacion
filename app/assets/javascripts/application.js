// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require nested_form_fields
//= require jquery_ujs
//= require paloma
//= require_tree .

$(document).ready(function(){
    Paloma.start();
});

Paloma.controller('Empresas', {
    create: function(){
        fields = ['#empresa_nombre_completo', '#empresa_nombre_empresa', '#empresa_email', '#empresa_rfc', '#password_input', '#password_confirmation']
        if(!validate_fields(fields)){
            if(!this.params.matching_passwords && !this.params.password_empty){
              display_message('Las contrasenas no coinciden','danger')
            } else {
              display_message('Hay campos que son requeridos','danger')
            }
        }
    }
});

Paloma.controller('Sessions', {
    create: function(){
      fields = ['#session_email', '#session_password']
      if(!validate_fields(fields)){
          if(this.params.campos_vacios)
            display_message('Hay campos que son requeridos','danger')
          else
            display_message('Los valores introducidos no coinciden con los registrados en el sistema','danger')
      }
    }
});

Paloma.controller('Sucursals', {
    create: function(){
        fields = ['#sucursal_nombre']
        if(!validate_fields(fields))
          display_message('Hay campos que son requeridos','danger')
    },

    update: function(){
        fields = ['#sucursal_nombre']
        if(!validate_fields(fields))
          display_message('Hay campos que son requeridos','danger')
    }
});

Paloma.controller('Empleados', {
    create: function(){
        fields = ['#empleado_sucursal_id', '#empleado_nombre', '#empleado_rfc']
        if(!validate_fields(fields))
          display_message('Hay campos que son requeridos','danger')
    },
    update: function(){
        fields = ['#empleado_sucursal_id', '#empleado_nombre', '#empleado_rfc']
        if(!validate_fields(fields))
          display_message('Hay campos que son requeridos','danger')
    }
});

function display_message(message, type){
    $('#flash_messages').removeClass();
    $('#flash_messages').addClass('alert');
    $('#flash_messages').addClass('alert-'+type);
    $('#flash_messages').html(message)
}

function validate_fields(fields){
    var valid_form = true
    for(var field of fields){
        if($(field).val() == ""){
            console.log(field+" es invalido")
            $(field).addClass('invalid')
            valid_form = false
        } else if(!$(field).val()){
            $(field).addClass('invalid')
            valid_form = false
        }
    }

    return valid_form
}
