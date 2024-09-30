Rails.application.routes.draw do
  root 'work_stations#index'
  resources :work_stations
end
