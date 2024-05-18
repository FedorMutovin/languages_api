# frozen_string_literal: true

Rails.application.routes.draw do
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
      namespace :public do
        resources :languages, only: [:index]
      end

      namespace :account do
        resources :account_learning_languages, only: [:create]
      end
    end
  end
end
