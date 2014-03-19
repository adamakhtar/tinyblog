Tinyblog::Engine.routes.draw do

  root :to => 'posts#index'

  resources :posts, :only => [:index, :show]

  namespace :admin do 
    root :to => 'posts#index'
    resources :authors
    resources :posts
    resources :authors
    resources :pictures, :only => [:create]
  end
end
