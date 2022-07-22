# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExoplanetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/').
          to route_to(controller: 'exoplanets', action: 'index')
    end

    it 'routes to #reload' do
      expect(get: '/exoplanets/reload').
          to route_to(controller: 'exoplanets', action: 'reload')
    end
  end

  describe 'paths' do
    it 'defines root_path' do
      expect(root_path).to eq '/'
    end

    it 'defines reload_exoplanets_path' do
      expect(reload_exoplanets_path).to eq '/exoplanets/reload'
    end
  end
end
