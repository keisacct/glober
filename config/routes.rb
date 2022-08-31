Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', 
    sessions: 'users/sessions'
  }
  root to: 'questions#index'
  resources :users, only: [:show] do
    resources :profiles, only: [:edit, :update]
  end

end
