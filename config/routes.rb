Tinyblog::Engine.routes.draw do

  root :to => 'posts#index'

  get 'sitemap' => 'sitemap#index', :format => :xml, :as => :sitemap

  resources :posts, :only => [:index, :show]

  namespace :admin do 
    root :to => 'posts#index'
    resources :authors
    resources :posts do 
      member { put :restore }
      resource :status, only: [:update], controller: 'posts/status'
    end
    resources :authors
    resources :pictures, :only => [:create]
  end
end
