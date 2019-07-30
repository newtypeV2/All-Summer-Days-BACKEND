Rails.application.routes.draw do
  # mount ActionCable.server => '/cable' 
  get '/characters' => 'characters#index'
  get '/characters/:id' => 'characters#show'
  patch '/characters/:id' => 'characters#update'
  post '/characters' => 'characters#create'
  delete '/characters/:id' => 'characters#destroy'
  get '/skills' => 'skills#index'
  get '/class' => 'char_classes#index'
  post '/signup' => 'login#create'
  post '/login' => 'login#new'
  get '/users/:id' => 'users#show'
end
