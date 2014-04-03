Rails.application.routes.draw do

  devise_for :users
  mount Tinyblog::Engine => "/tinyblog"
end
