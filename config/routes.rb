Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: [:index, :show]
  end

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations', 
    sessions: 'users/sessions'
  }

  resources :users, only: [:show, :edit, :update] do
    resources :visited_countries, only: [:new, :create, :edit, :update]
  end

  root to: "questions#index"


end
