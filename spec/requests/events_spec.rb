require 'rails_helper'

RSpec.describe 'Events', type: :request do
  describe 'GET /events' do
    it 'works! (now write some real specs)' do
      get events_path
      expect(response).to have_http_status(200)
    end
    it 'redirect to sign in, if not signed in' do
      get '/events/new'
      expect(response).to redirect_to(sign_in_path)
    end
  end
end
