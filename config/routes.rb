Rails.application.routes.draw do
  resources :dashboards do
    get 'input_biobox'
  end
  resources :tickets
  root 'dashboards#index'
end
