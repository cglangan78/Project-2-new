Rails.application.routes.draw do

##Picture Routes##
root 'pictures#index'

get '/pictures/new' => 'pictures#new'

post '/pictures/new' => 'pictures#create', as: :create

get '/pictures/:id' => 'pictures#show', as: :picture

delete '/pictures/:id' => 'pictures#destroy', as: :delete_picture

get '/pictures/:id/edit' => 'pictures#edit', as: :edit_picture

patch '/pictures/:id' => 'pictures#update'




##Sessions Routes ##
get 'login' => 'sessions#new'

delete 'logout' => 'sessions#destroy'

resources :sessions, only: [:new, :create, :destroy]

resources :users, only: [:new, :index, :create, :edit, :update, :destroy, :show]

resources :pictures do
  member do
    put "like"    =>  "pictures#upvote"
    put "dislike" => "pictures#downvote"
  end
  resources :comments, only: [:edit, :create, :update, :destroy]
end
end
