Rails.application.routes.draw do
  resources :applicants
  
  get :funnel, to: 'funnels#index'
  root 'applicants#show'
end
