Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  resources :home, only: [:index]
  resources :films do
    resources :comments, only: [:create, :destroy]
    resources :votes, only:[:create, :destroy]
  end

  resources :categories, only: [:show, :index]
end
