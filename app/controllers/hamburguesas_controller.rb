class HamburguesasController < ApplicationController
  before_action :set_hamburguesa, only: [:show, :update, :destroy]

  def index
    @hamburguesas = Hamburguesa.all
    respond_with @hamburguesas
  end

  def show
    respond_with @hamburguesa
  end

  def create
    @hamburguesa = Hamburguesa.new(hamburguesa_params)
    if @hamburguesa.save
      respond_with @hamburguesa, status: :created
    else
      respond_with @hamburguesa.errors, status: :unprocessable_entity
    end
  end

  def update
    if @hamburguesa.update(hamburguesa_params)
      respond_with @hamburguesa, status: :ok
    else
      respond_with @hamburguesa.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hamburguesa.destroy
    head :ok
  end

  def add_ingrediente
    ingrediente = Ingrediente.find(params[:ingrediente_id])
    hamburguesa = Hamburguesa.find(params[:hamburguesa_id])
    hamburguesa.ingredientes << ingrediente
    if hamburguesa.save
      respond_with hamburguesa, status: :created
    else
      respond_with hamburguesa.errors, status: :unprocessable_entity
    end
  end

  def delete_ingrediente
    ingrediente = Ingrediente.find(params[:ingrediente_id])
    hamburguesa = Hamburguesa.find(params[:hamburguesa_id])
    hamburguesa.ingredientes.delete(ingrediente)
    if hamburguesa.save
      respond_with hamburguesa, status: :ok
    else
      respond_with hamburguesa.errors, status: :unprocessable_entity
    end
  end

  private
    def set_hamburguesa
      @hamburguesa = Hamburguesa.find(params[:id])
    end

    def hamburguesa_params
      params.require(:hamburguesa).permit(:nombre, :descripcion, :imagen, :precio)
    end
end
