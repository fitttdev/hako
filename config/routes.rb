# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  scope 'api/v1' do
    devise_for(
      :users,
      controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations',
        passwords: 'api/v1/passwords',
        confirmations: 'api/v1/confirmations'
      },
      defaults: { format: :json }
    )
  end
end
