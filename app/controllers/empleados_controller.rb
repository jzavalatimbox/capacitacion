class EmpleadosController < ApplicationController

  before_action :set_empleado, only: [:edit, :update, :show, :destroy]
  before_action :require_same_sucursal, only: [:edit, :update, :destroy]

  def index
    @empleados = current_empresa.sucursals
  end

  def new
    @empleado = Empleado.new
  end

  def edit
  end

  def create
    @empleado = Empleado.new(empleado_params)
    if @empleado.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @empleado.update(empleado_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @sucursal = @empleado.sucursal
    @empleado.destroy
    redirect_to edit_sucursal_path(@sucursal)
  end

  private
    def set_empleado
      @empleado = Empleado.find(params[:id])
    end

    def empleado_params
      params.require(:empleado).permit(:nombre, :rfc, :puesto, :sucursal_id)
    end

    def require_same_sucursal
      if current_empresa != @empleado.sucursal.empresa
        redirect_to root_path
      end
    end

end
