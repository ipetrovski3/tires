Rails.application.routes.draw do
  root to: 'warehouses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :warehouses, only: [:index] do
    resources :clients
  end
end
