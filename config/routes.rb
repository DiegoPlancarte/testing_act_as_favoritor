Rails.application.routes.draw do
  resources :items
  resources :favorites
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get '*path', to: 'home#index', constraints: ->(request){ request.format.html? }
  root to: "home#index"
end
