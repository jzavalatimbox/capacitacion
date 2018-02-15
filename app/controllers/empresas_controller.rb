class EmpresasController < ApplicationController

  def new
    redirect_to sucursals_path if logged_in?
    @empresa = Empresa.new
  end

  def create
    @empresa = Empresa.new(empresa_params)
    if @empresa.save
        session[:empresa_id] = @empresa.id
        flash[:success] = "Registro exitoso"
        redirect_to root_path
    else
      js :matching_passwords => (@empresa.password == @empresa.password_confirmation), :password_empty => @empresa.password.blank?
      render 'new'
    end
  end


  private
  def empresa_params
    params.require(:empresa).permit(:nombre_completo, :email, :rfc, :nombre_empresa, :password, :password_confirmation)
  end

end
