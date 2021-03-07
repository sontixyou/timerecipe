Rails.application.routes.draw do

  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  
end
