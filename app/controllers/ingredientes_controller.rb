class IngredientesController < ApplicationController
  before_action :set_ingrediente, only: [:show, :update, :destroy]

  def index
    @ingredientes = Ingrediente.all
    render json: @ingredientes
  end

  def show
    render json: @ingrediente
  end

  def create
    @ingrediente = Ingrediente.new(ingrediente_params)
    if @ingrediente.save
      render json: @ingrediente, status: :created
    else
      render json: @ingrediente.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ingrediente.update(hamburguesa_params)
      render json: @ingrediente, status: :ok
    else
      render json: @ingrediente.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @ingrediente.destroy
  end

  private
    def set_ingrediente
      @ingrediente = Ingrediente.find(params[:id])
    end

    def ingrediente_params
      params.require(:ingrediente).permit(:nombre, :descripcion)
    end
end
