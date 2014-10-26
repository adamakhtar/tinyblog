Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  mount Tinyblog::Engine => "/tinyblog"
end
