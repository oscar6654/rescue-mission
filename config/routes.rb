Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions do
    resources :answers, only: [:new, :create]
  end
  namespace :api do
    namespace :v1 do
      resources :answers, only: [:index, :create, :show]
    end
  end
  resources :answers, only: [:edit, :update]

  namespace :api do
    namespace :v1 do
      resources :questions, only: [:index]
    end
  end
  root "questions#index"
end
