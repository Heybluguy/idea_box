Rails.application.routes.draw do
  root "welcome#index"
  resources :ideas
  namespace :admin do
    resources :categories
  end
  resources :categories, only: [:index, :destroy, :new, :create]
  resources :users, only: [:new, :index, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/session', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
