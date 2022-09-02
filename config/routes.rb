Rails.application.routes.draw do
  devise_for :users
  root "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  #mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
end
