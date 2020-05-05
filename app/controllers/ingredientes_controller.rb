class IngredientesController < ApplicationController
  before_action :set_ingrediente, only: [:show, :update, :destroy]

  def index
    @ingredientes = Ingrediente.all
    respond_with @ingredientes
  end

  def show
    respond_with @ingrediente
  end

  def create
    @ingrediente = Ingrediente.new(ingrediente_params)
    if @ingrediente.save
      respond_with @ingrediente, status: :created
    else
      respond_with @ingrediente.errors, status: :unprocessable_entity
    end
  end

  def update
    if @ingrediente.update(hamburguesa_params)
      respond_with @ingrediente, status: :ok
    else
      respond_with @ingrediente.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @ingrediente.hamburguesas.empty?
      @ingrediente.destroy
      head :ok
    else
      respond_with @ingrediente, status: :conflict
    end
  end

  private
    def set_ingrediente
      @ingrediente = Ingrediente.find(params[:id])
    end

    def ingrediente_params
      params.require(:ingrediente).permit(:nombre, :descripcion)
    end
end
