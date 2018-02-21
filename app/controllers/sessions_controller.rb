class SessionsController < ApplicationController

  def new
  end

  def create
    empresa = Empresa.find_by(email: params[:session][:email].downcase)
    if empresa && empresa.authenticate(params[:session][:password])
        session[:empresa_id] = empresa.id
        redirect_to sucursals_path
    else
      js :auth => false, :email => params[:session][:email]
      render 'new'
    end

  end

  def destroy
    session[:empresa_id] = nil
    redirect_to root_path
  end

end
