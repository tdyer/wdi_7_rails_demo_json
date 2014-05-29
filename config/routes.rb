Rails.application.routes.draw do
  resources :books, defaults: {format: 'json'}
  resources :authors, defaults: {format: 'json'}
end
