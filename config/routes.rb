Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: "recipes#index"
  resources :recipes do
    collection do
      get 'search'
    end
    resources :comments, only: :create
  end
  
end
