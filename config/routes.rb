Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"

  resources :users
  resources :leagues do
    resources :teams
  end
  
  get 'login', to: 'sessions#new', as: 'login'
  post 'sessions', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  post '/leagues/:league_id/drafts', to: 'drafts#create', as: 'create_draft'
  get '/leagues/:league_id/drafts/:id', to: 'drafts#show', as: 'draft'
end
