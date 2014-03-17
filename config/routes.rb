Tinyblog::Engine.routes.draw do

  get "authors/index"
  get "authors/new"
  get "authors/create"
  get "authors/edit"
  get "authors/update"
  get "authors/destroy"
  root :to => 'posts#index'

  resources :posts, :only => [:index, :show]

  namespace :admin do 
    root :to => 'posts#index'
    
    resources :posts
    resources :authors
    resources :pictures, :only => [:create]
  end
end
