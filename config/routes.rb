Rails.application.routes.draw do
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get 'shifts', to: 'shifts#index'
  # get 'shifts/:id', to: 'shifts#show'

  # get 'workers', to: 'workers#index'
  # get 'workers/:id', to: 'workers#show'
  resources :workers
  resources :shifts
end
