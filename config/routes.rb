Rails.application.routes.draw do
  root "welcome#index"
  delete '/logout', to: 'sessions#destroy', as: "logout"
  resources :ideas
  namespace :admin do
    resources :users
    resources :categories
    resources :ideas
  end
  resources :categories, only: [:index, :new]
  resources :users, only: [:new, :index, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
