Rails.application.routes.draw do
  get 'messages/index'

  get 'messages/create'

  root to: 'sessions#new'

  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
