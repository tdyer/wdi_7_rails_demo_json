Rails.application.routes.draw do
  get '/tweets' => 'tweets#index'
  
  resources :books, defaults: {format: 'json'}
  resources :authors, defaults: {format: 'json'}
end
