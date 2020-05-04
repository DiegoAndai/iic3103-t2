class HamburguesasController < ApplicationController
  before_action :set_hamburguesa, only: [:show, :update, :destroy]

  def index
    @hamburguesas = Hamburguesa.all
    render json: @hamburguesas
  end

  def show
    render json: @hamburguesa
  end

  def create
    @hamburguesa = Hamburguesa.new(hamburguesa_params)
    if @hamburguesa.save
      render json: @hamburguesa, status: :created
    else
      render json: @hamburguesa.errors, status: :unprocessable_entity
    end
  end

  def update
    if @hamburguesa.update(hamburguesa_params)
      render json: @hamburguesa, status: :ok
    else
      render json: @hamburguesa.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @hamburguesa.destroy
  end

  private
    def set_hamburguesa
      @hamburguesa = Hamburguesa.find(params[:id])
    end

    def hamburguesa_params
      params.require(:hamburguesa).permit(:nombre, :descripcion, :imagen, :precio)
    end
end
