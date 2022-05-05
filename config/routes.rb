Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: 'costumes#home'
  # get '/costumes/', to: 'costumes#index'
  # get '/costumes/new', to: 'costumes#new'
  # get '/costumes/:id', to: 'costumes#show', as: :costume
#   resources :costumes, only: [:index, :new, :create, :show] do
#     resources :reservations, only: :create
#   end


#   get '/users/:user_id/costumes', to: 'users#list_by_user'

#   post '/costumes/', to: 'users#create'

#   get '/costumes/:id/edit', to: 'users#edit'

#   post '/costumes/:id/edit', to: 'users#update'

#   get '/my_costumes', to: 'users#my_costumes'

#   delete '/costumes/:id', to: 'users#destroy'

#   get '/costumes/:costume_id/reservations/new', to: 'reservations#new'
#   post '/costumes/:costume_id/reservations', to: 'reservations#create'

#   get '/my_reservations/', to: 'reservations#my_reservations'
#   get '/my_requests', to: 'reservations#my_requests'
#   patch '/my_requests/:id', to: 'reservations#set_status'

resources :users do
    resources :reservations, only: [:show, :index]
end

resources :users, only: [:index, :show, :edit, :update]
resources :costumes do

    resources :reservations, only: [:new, :create]
  end

  resources :reservations, only: [:index, :show, :edit, :update]
  patch "cancel_reservation/:id", to: "reservations#cancel", as: :cancel_reservation
  patch "approved_reservation/:id", to: "reservations#approved", as: :approved_reservation
end
