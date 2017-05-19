Rails.application.routes.draw do
  resources :tickets do
    collection {get 'input_biobox'}
  end
  root 'tickets#index'
end
