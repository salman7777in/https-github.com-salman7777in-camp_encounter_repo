Rails.application.routes.draw do

  root to: "home#index"
  get '/home/new', to: "home#privacy"

  # Home controller
  # index action
  # home folder in views
  # index.html.erb
  # add logout link by googlin it that how to add logout link
  devise_for :users
  
  namespace :admin do
    resources :users
  end
  # get '/search', to: "admin/users#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
