Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :profiles
  # Defines the root path route ("/")
  # root "articles#index"
  resources :articles
  resources :articles do
    member do
      post 'like'
      post 'unlike'
    end
  end
  root 'articles#index'
  resources :bookmarks, only: [:create, :destroy]
  resources :articles do
    member do
      get :my_article_view
      get :my_article
      post :bookmark
      delete :unbookmark
    end
  end
  resources :profiles do
    member do
      get :show_user_profile
    end
  end
  # post 'follow', to: 'profiles#follow' 
  # resources :profiles do
  #   member do
  #     post 'follow/:user_id', to: 'profiles#follow', as: 'follow'
  #     delete 'unfollow/:user_id', to: 'profiles#unfollow', as: 'unfollow'
  #   end
  # end  
 
  get '/sports', to: 'sports#index'
  get '/politics', to: 'politics#index'
  get '/technologyes', to: 'technologyes#index'
  get '/healths', to: 'healths#index'
  get '/governments', to: 'governments#index'
  get '/fashiones', to: 'fashiones#index'
  get '/businesses', to: 'businesses#index'
  get '/automobiles', to: 'automobiles#index'

  resources :articles do
    resources :ratings, only: [:create, :update, :destroy]
  end

  
end
