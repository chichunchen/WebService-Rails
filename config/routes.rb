WebServiceRails::Application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # resources :products, only: [:index, :show]
  resources :products
  post 'api/v1/products/create' => 'products#api_create'

  # resources :users, only: [:index, :show]

  root to: "products#index"

  devise_scope :users do
    get "users", to: "users#index"
  end

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: "users/sessions" }

  # namespace :users do
  #   resource :profile
  # end

  # get 'users/:id/profile' => 'users#show'

  get 'users/profiles' => 'users#index'
  get 'users/profile/:id' => 'users#show'


  get 'admin/products/show_image/:id' => 'admin/products#show_image'
  get 'application/show_image/:model/:id' => 'application#show_image'

  post 'test' => 'api/v1/sessions#test'

  # api
  namespace :api do
    namespace :v1 do
      # resources :tokens, :defaults => { :format => 'json' }, :only => [:create, :destroy]
      resources :users, only: [:show, :create, :update, :destroy]
      resources :sessions, only: [:create, :update]
    end
  end

end
