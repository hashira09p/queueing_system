Rails.application.routes.draw do
  root 'work_stations#index'
  get 'work_stations', to: 'work_stations#work_stations'
  resources :work_stations
  resources :tickets do
    get 'generate', on: :collection
  end


end
