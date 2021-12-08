Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to: "posts#index"
  resources :users, only: [:edit, :update]
  resources :posts, only: [:index, :new, :create, :destroy, :edit, :update]
end
