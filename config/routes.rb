Rails.application.routes.draw do
  get '/characters' => 'characters#index'
  get '/characters/:id' => 'characters#show'
  patch '/characters/:id' => 'characters#update'
  post '/characters/:id' => 'characters#create'
  delete '/characters/:id' => 'characters#destroy'
  get '/skills' => 'skills#index'
  get '/class' => 'char_classes#index'
end
