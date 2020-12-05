Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  resources :games
  get '/new', to: 'games#new', as: 'newgame'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
