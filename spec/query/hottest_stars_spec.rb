# frozen_string_literal: true

require 'rails_helper'

RSpec.describe HottestStars do
  let(:exoplanets_json) { File.read Rails.root.join('spec/fixtures/exoplanets.json') }
  let(:hottest_star) { HottestStars.new }
  let(:hottest) { hottest_star.hottest }

  before(:each) do
    allow(ExoplanetsDb.instance).to receive(:json).and_return exoplanets_json
    ExoplanetsDb.instance.reload
  end

  describe 'hottest' do
    it 'returns an array with the single hottest star' do
      expect(hottest.length).to eq 1
      expect(hottest.first.PlanetIdentifier).to eq '<p>SType Large'
    end

    it 'returns an array with all stars with equal hottness sorted by PlanetIdentifier' do
      allow(ExoplanetsDb.instance).to receive(:json).and_return exoplanets_json.gsub('3591', '13584')
      ExoplanetsDb.instance.reload

      expect(hottest.length).to eq 2
      expect(hottest.map(&:PlanetIdentifier)).to eq(['<p>Orphan Large', '<p>SType Large'])
    end
  end
end
