Rails.application.routes.draw do
  devise_for :users
  resources :scores
  resources :users
  resources :games do
    resources :rounds
  end
  root 'games#index'
end
