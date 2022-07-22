# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExoplanetsController do
  describe 'reload' do
    before(:each) do
      allow(ExoplanetsDb.instance).to receive(:reload)
    end

    it 'reloads the ExoplanetsDb' do
      get :reload

      expect(ExoplanetsDb.instance).to have_received(:reload)
    end

    it 'redirects to the root' do
      get :reload

      expect(response).to be_redirect
      expect(response.redirect_url).to eq 'http://test.host/'
    end
  end
end
