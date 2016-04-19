Rails.application.routes.draw do

  resources :events do
    resources :combats
    resources :registers
    get 'registers/:id/select_combats' =>'registers#select_combats', as: :select_combats
    patch 'registers/:id/select_combats' =>'registers#select_combats'
  end
  resources :people
  root 'pages#index'

  devise_for :users, controllers: {registrations: 'users/registrations' }
end
