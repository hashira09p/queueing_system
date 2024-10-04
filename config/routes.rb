Rails.application.routes.draw do
  root 'work_stations#index'
  resources :work_stations do
    patch 'next'
    patch 'finish'
    get 'queueing_lists', on: :collection
    patch 'offline'
    patch 'online'
    patch 'break'
  end
  resources :tickets do
    post 'generate', on: :collection
    get 'display_transactions', on: :collection
  end
  resources :available_transactions
end
