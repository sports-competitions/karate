Rails.application.routes.draw do

  root 'pages#index'

  devise_for :registrators, controllers: {registrations: 'registrators/registrations' }
end
