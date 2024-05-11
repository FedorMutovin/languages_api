# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  devise_for :users, path: 'api/v1',
                     path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       registration: 'signup'
                     },
                     controllers: {
                       registrations: 'api/v1/users/registrations',
                       sessions: 'api/v1/users/sessions'
                     }

  namespace :api do
    namespace :v1 do
      resources :languages, only: [:index]
      resources :account_learning_languages, only: [:create]

      get 'language_assistant/message_history', to: 'language_assistant#message_history'
      post 'language_assistant/create_message', to: 'language_assistant#create_message'
    end
  end
end
