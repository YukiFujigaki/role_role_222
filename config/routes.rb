Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/user_profiles', to: 'user_profiles#index'
  get '/user_profiles/:id', to: 'user_profiles#show'
  get '/user_profiles/:id/new', to: 'user_profiles#new'
  post '/user_profiles/:id/create', to: 'user_profiles#create'
  get '/user_profiles/:id/edit', to: 'user_profiles#edit'
  post '/user_profiles/:id/update', to: 'user_profiles#update'
end
