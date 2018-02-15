class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_empresa, :logged_in?

  def current_empresa
    @current_empresa ||= Empresa.find(session[:empresa_id]) if session[:empresa_id]
  end

  def logged_in?
    !!current_empresa
  end

  def require_empresa
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
