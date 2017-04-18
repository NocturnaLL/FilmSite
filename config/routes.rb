Rails.application.routes.draw do
  devise_for :users
  root "film#mine"
  resources :home, only: [:index]
  resources :films do
    collection do
      get :mine
      get :recent
    end
    resources :comments, only: [:create, :destroy]
    resources :votes, only:[:create, :update]
  end

  resources :categories do
    member do
      get :top_films
    end
  end
end
