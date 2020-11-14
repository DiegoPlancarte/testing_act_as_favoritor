Rails.application.routes.draw do
  resources :items
  resources :favorites
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root to: "home#index"
end
