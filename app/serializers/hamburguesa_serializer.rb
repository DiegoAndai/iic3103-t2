class HamburguesaSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :nombre, :descripcion, :imagen, :precio, :ingredientes

  def ingredientes
    object.ingredientes.map do |ingrediente|
      {
        path: ingrediente_url(ingrediente)
      }
    end
  end
end