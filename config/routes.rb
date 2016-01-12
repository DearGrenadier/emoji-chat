Rails.application.routes.draw do
  root to: 'application#app'

  resources :messages, only: [:index, :create]
  resources :sessions, only: [:new, :create]
  resources :emoji, only: [:index]
  get 'sessions/show'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
