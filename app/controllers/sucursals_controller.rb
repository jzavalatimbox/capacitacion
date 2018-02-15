class SucursalsController < ApplicationController

  before_action :set_sucursal, only: [:edit, :update, :show, :destroy]
  before_action :require_empresa, except: []
  before_action :require_same_empresa, only: [:edit, :update, :destroy]

  def index
    @sucursals = current_empresa.sucursals
  end

  def new
    @sucursal = Sucursal.new
  end

  def edit

  end

  def create
    @sucursal = Sucursal.new(sucursal_params)
    @sucursal.empresa = current_empresa

    if @sucursal.save
      flash[:success] = "Sucursal creada exitosamente"
      redirect_to root_path
    else
      flash[:danger] = "Hay campos que se requieren"
      render 'new'
    end

  end

  def update
    if @sucursal.update(sucursal_params)
      flash[:success] = "Sucursal modificada exitosamente"
      redirect_to root_path
    else
      flash[:danger] = "Hay campos que se requieren"
      render 'edit'
    end
  end

  def destroy
    @sucursal.destroy
    flash[:success] = "Sucursal eliminada"
    redirect_to sucursals_path
  end

  private
  def set_sucursal
      @sucursal = Sucursal.find(params[:id])
    end

    def sucursal_params
      params.require(:sucursal).permit(:nombre, :calle, :colonia, :numero_exterior, :numero_interior, :codigo_postal, :ciudad, :pais, empleados_attributes:[:nombre, :rfc, :puesto, :_destroy, :id])
    end

    def require_same_empresa
      if current_empresa != @sucursal.empresa
        flash[:danger] = "Solo puedes acceder a tus sucursales"
        redirect_to root_path
      end
    end

end
