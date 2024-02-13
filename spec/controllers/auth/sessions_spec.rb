# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Auth::SessionsController do
  include Devise::Test::ControllerHelpers

  let(:devise_mapping) { Devise.mappings[:user] }
  let(:user) { create(:user) }
  let(:sign_in_params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  before do
    request.env['devise.mapping'] = devise_mapping
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'redirects to the root path' do
        post :create, params: sign_in_params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid credentials' do
      it 'does not authenticate user and redirects to sign-in page' do
        post :create, params: { user: { email: user.email, password: 'invalid' } }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
