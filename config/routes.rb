Rails.application.routes.draw do

  devise_for :users
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
    end
    post 'favorite/:id' => 'favorites#create', as: 'create_favorite'
    delete 'favorite/:id' => 'favorites#destroy', as: 'destroy_favorite'
    resources :comments, only: :create
  end
  
end
