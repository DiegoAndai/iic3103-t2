Rails.application.routes.draw do
  resources :ingredientes,
    only: [:index, :show, :create, :update, :destroy],
    path: 'ingrediente'
  resources :hamburguesas, only: [:index, :show, :create, :update, :destroy],
    path: 'hamburguesa' do
      put 'ingrediente/:ingrediente_id', to: 'hamburguesas#add_ingrediente'
      delete 'ingrediente/:ingrediente_id', to: 'hamburguesas#delete_ingrediente'
  end
end
