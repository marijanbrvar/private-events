require 'rails_helper'

RSpec.describe 'events', type: :request do
  describe 'GET show' do
    it 'redirect to sign in, if not signed in' do
      get '/events/new'
      expect(response).to redirect_to(sign_in_path)
    end
  end
end