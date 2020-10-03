Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: [:new, :show, :index, :destroy, :create, :update, :edit] do
    member do
      get :color
    end
  end
   get '/wardrobe', to: 'pages#wardrobe'

end
