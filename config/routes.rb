Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'costumes#home'
  get '/costumes/', to: 'costumes#index'
  get '/costumes/:id', to: 'users#show'
  get '/users/:user_id/costumes', to: 'users#list_by_user'
  get '/costumes/new', to: 'users#new'

  post '/costumes/', to: 'users#create'

  get '/costumes/:id/edit', to: 'users#edit'

  post '/costumes/:id/edit', to: 'users#update'

  get '/my_costumes', to: 'users#my_costumes'

  delete '/costumes/:id', to: 'users#destroy'
end
