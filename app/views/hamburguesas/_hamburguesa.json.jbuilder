json.extract! hamburguesa, :id, :nombre, :descripcion, :imagen, :precio, :created_at, :updated_at
json.url hamburguesa_url(hamburguesa, format: :json)
