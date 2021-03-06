Rails.application.routes.draw do
  resources :player_stats

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: 'home#index'
  resources :users, only: [:show, :index] 
  get 'profile', to: 'users#show'
  get 'test', to: 'home#index2'
  get 'faq', to: 'home#faq'
  get 'kota', to: 'home#kota'
  get 'kurt', to: 'home#kurt'
  resources :microposts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
