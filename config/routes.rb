Rails.application.routes.draw do
  root to: "games#index"
  resources :games
  resources :moves, only: [:create]
end
