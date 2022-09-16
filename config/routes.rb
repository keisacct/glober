Rails.application.routes.draw do
  resources :questions do
    resources :answers, except: [:index, :show]
  end
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations', 
    sessions: 'users/sessions'
  }

  root to: "questions#index"
  resources :users, only: [:show, :edit, :update] do
    resources :maps, only: [:edit, :update]
  end

end
