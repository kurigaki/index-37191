Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'
  root to: "posts#index"
  resources :users, only: [:edit, :update, :show]
  resources :posts do
    collection do
      get 'search'
    end
  end
end
