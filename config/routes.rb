Rails.application.routes.draw do
  get 'rx', to: 'rx#create', as: 'rx'
  get 'fx', to: 'fx#show',   as: 'fx'
  resources :reserves
  resources :fares
  get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
