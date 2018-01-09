Rails.application.routes.draw do
  root "welcome#index"
  resources :ideas
  resources :categories
  resources :users, only: [:new, :index, :create, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
