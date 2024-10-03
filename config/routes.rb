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
    get 'generate', on: :collection
  end
end
