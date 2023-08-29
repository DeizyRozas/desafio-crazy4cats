Rails.application.routes.draw do
  resources :comment, only: [:create]
  resources :posts  do
    member do
      put "upvote", to: "posts#upvote"
      put "downvote", to: "posts#downvote"
    end
  end
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
    }
    
  devise_scope :user do
    get 'users/sign_out', to: 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "welcome#index"
end
