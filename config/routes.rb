Rails.application.routes.draw do

##Picture Routes##
root 'pictures#index'

get '/pictures/new' => 'pictures#new'

post '/pictures/new' => 'pictures#create', as: :create

get '/pictures/:id' => 'pictures#show', as: :picture

delete '/pictures/:id' => 'pictures#destroy', as: :delete_picture

get '/pictures/:id/edit' => 'pictures#edit', as: :edit_picture

patch '/pictures/:id' => 'pictures#update'

##Users Routes ##
get '/users'=> 'users#index'

##Sessions Routes ##
get 'login' => 'sessions#new', as: :new_session

resources :sessions, only: [:new, :create, :destroy]

resources :users, only: [:new, :index, :create]

resources :pictures

end
