Rails.application.routes.draw do
  devise_for :users
  mount ActionCable.server, at: '/cable'

  resources :chat_rooms

  root 'chat_rooms#index'
end