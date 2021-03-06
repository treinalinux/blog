Rails.application.routes.draw do
  root 'posts#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts do
    get :search, on: :collection
  end

  resources :comments, only: %i[create]
end
