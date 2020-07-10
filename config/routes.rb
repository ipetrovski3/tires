Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  root to: 'warehouses#index'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :warehouses, only: [:index] do
    resources :comintents do
      resources :clients
    end
  end
end
