Rails.application.routes.draw do
  resources :applicants
  
  root 'applicants#show'
end
