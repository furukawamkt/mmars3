Rails.application.routes.draw do
  get 'rx', to: 'rx#regist', as: 'rx'
  get 'fx', to: 'fx#calc',   as: 'fx'
  get 'tx', to: 'tx#index',  as: 'tx'
  post 'tx', to: 'tx#reserve'
  resources :reserves
  resources :fares
  get 'hello_page/hello'
  root 'hello_page#hello'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
