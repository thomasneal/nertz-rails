Rails.application.routes.draw do
  resources :scores
  resources :users
  resources :games do
    resources :rounds
  end
end
