Rails.application.routes.draw do
  resources :ingredientes, only: [:index, :show, :create, :update, :destroy]
  resources :hamburguesas, only: [:index, :show, :create, :update, :destroy] do
    put 'ingrediente/:ingrediente_id', to: 'hamburguesas#add_ingrediente'
    delete 'ingrediente/:ingrediente_id', to: 'hamburguesas#delete_ingrediente'
  end
end
