Rails.application.routes.draw do
  get 'tx/index'
  get 'tx/reserve'
  get 'tx/buy'
  get 'rx', to: 'rx#regist', as: 'rx'
  get 'fx', to: 'fx#calc',   as: 'fx'
  resources :reserves
  resources :fares
  get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
