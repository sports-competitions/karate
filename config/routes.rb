Rails.application.routes.draw do

  resources :events do
    resources :combats
  end
  resources :people
  root 'pages#index'

  devise_for :registrators, controllers: {registrations: 'registrators/registrations' }
end
