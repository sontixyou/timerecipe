Rails.application.routes.draw do

  root to: "recipes#index"
  resources :recipes, only: [:index]
end
