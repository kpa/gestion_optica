Arena::Application.routes.draw do
  resources :ordenes_trabajo do
    collection do
      get :find_items
    end
  end

  resources :clientes do
    collection do
      get :find_items
    end
    resources :ordenes_trabajo
  end

  match '/' => 'main#index'
  match '/:controller(/:action(/:id))'
end
