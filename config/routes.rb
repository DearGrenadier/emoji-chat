Rails.application.routes.draw do
  root to: 'sessions#new'

  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create]
  get 'sessions/show'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
