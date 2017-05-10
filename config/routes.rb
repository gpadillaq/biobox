Rails.application.routes.draw do
  root 'dashboards#index'
  resource :dashboard, as: 'dashboard' do
    get 'input_biobox'
  end
end
