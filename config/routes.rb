Rails.application.routes.draw do

  resources :ideas, only: [:new, :create, :index, :edit, :update, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
