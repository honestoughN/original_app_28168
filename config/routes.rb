Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "hearts#index"
  resources :hearts do
    resources :comments, only: [:new, :create]
  end
  resources :user, only: :show
end
