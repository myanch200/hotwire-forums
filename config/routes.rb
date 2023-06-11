Rails.application.routes.draw do
  root 'main#index'
  devise_for :users

  resources :discussions, only: %i[index new create edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
