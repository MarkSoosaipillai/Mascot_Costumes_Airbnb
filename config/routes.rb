Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'costumes#home'
  get '/costumes/', to: 'costumes#index'
  get '/costumes/:id', to: 'costumes#show', as: :costume

  get '/users/:user_id/costumes', to: 'users#list_by_user'
  get '/costumes/new', to: 'users#new'

  post '/costumes/', to: 'users#create'

  get '/costumes/:id/edit', to: 'users#edit'

  post '/costumes/:id/edit', to: 'users#update'

  get '/my_costumes', to: 'users#my_costumes'

  delete '/costumes/:id', to: 'users#destroy'

  get '/costumes/:costume_id/reservations/new', to: 'reservations#new'
  post '/costumes/:costume_id/reservations', to: 'reservations#create'

  get '/my_reservations/', to: 'reservations#my_reservations'
  get '/my_requests', to: 'reservations#my_requests'
  patch '/my_requests/:id', to: 'reservations#set_status'

end
