Rails.application.routes.draw do

  resources :people
  root 'pages#index'

  devise_for :registrators, controllers: {registrations: 'registrators/registrations' }
end
