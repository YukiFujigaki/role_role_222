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

  get '/role_models', to: 'role_models#index'
  get '/role_models/new', to: 'role_models#new'
  post '/role_models/create', to: 'role_models#create'
  get '/role_models/:id', to: 'role_models#show'
  get '/role_models/:id/edit', to: 'role_models#edit'
  patch '/role_models/:id/update', to: 'role_models#update'

  get '/tags/autocomplete_tag/all_tags', to: 'tags#all_tags'
  get '/tags/autocomplete_tag/:tag', to: 'tags#autocomplete_tag'
end
