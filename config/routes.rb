Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "hearts#index"
  resources :hearts do
    resources :comments, only: [:new, :create]
    resource :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
end
