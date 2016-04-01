Rails.application.routes.draw do

  resources :events do
    resources :combats do
      resources :teams
    end
    resources :registers
  end
  resources :people
  root 'pages#index'

  devise_for :registrators, controllers: {registrations: 'registrators/registrations' }
end
