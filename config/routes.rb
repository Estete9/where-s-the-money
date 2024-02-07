Rails.application.routes.draw do
  resources :categories do
    resources :activities
  end

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  get "/splash", to: "pages#splash", as: "splash"
  get "up" => "rails/health#show", as: :rails_health_check

  # For authenticated users, root to categories#index
  authenticated :user do
    root to: 'categories#index', as: :authenticated_root
  end

  # For unauthenticated users, root to the splash screen
  root to: 'pages#splash'
end
