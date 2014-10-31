Tinyblog::Engine.routes.draw do

  root :to => 'posts#index'

  get 'sitemap' => 'sitemap#index', :format => :xml, :as => :sitemap

  resources :posts, :only => [:index, :show]

  namespace :admin do 
    root :to => 'posts#index'
    resources :authors
    resources :posts, except: [:edit] do 
      member { put :restore }
      resource :status, only: [:update], controller: 'posts/status'
    end
    
    resource :editor, path: 'editor/:id',  only: [:edit, :update], controller: 'editor' 

    resource :editor, only: [:edit, :update], controller: 'posts/editor'
    resources :authors
    resources :pictures, :only => [:create]
  end
end
