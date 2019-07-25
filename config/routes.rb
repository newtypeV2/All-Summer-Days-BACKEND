Rails.application.routes.draw do
  get '/characters' => 'characters#index'
  get '/character/:id' => 'characters#show'
  patch '/character/:id' => 'characters#update'
  post '/character/:id' => 'characters#create'
  delete '/characters/:id' => 'characters#destroy'
  get '/skills' => 'skills#index'
  get '/class' => 'char_classes#index'
end
