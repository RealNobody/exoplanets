# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DiscoveriesByYear do
  let(:exoplanets_json) { File.read Rails.root.join('spec/fixtures/exoplanets.json') }

  before(:each) do
    allow(ExoplanetsDb.instance).to receive(:json).and_return exoplanets_json
    ExoplanetsDb.instance.reload
  end

  describe 'annual_discoveries' do
    let(:discoveries) { DiscoveriesByYear.instance.annual_discoveries }

    it 'returns a sorted list of the AnnualDiscoveries for each year' do
      expect(discoveries.length).to eq 9

      expect(discoveries[0].year).to eq 'Unknown'
      expect(discoveries[0].small_planets).to eq 1
      expect(discoveries[0].medium_planets).to eq 0
      expect(discoveries[0].large_planets).to eq 0

      expect(discoveries[1].year).to eq 1902
      expect(discoveries[1].small_planets).to eq 0
      expect(discoveries[1].medium_planets).to eq 2
      expect(discoveries[1].large_planets).to eq 0

      expect(discoveries[2].year).to eq 1927
      expect(discoveries[2].small_planets).to eq 0
      expect(discoveries[2].medium_planets).to eq 1
      expect(discoveries[2].large_planets).to eq 0

      expect(discoveries[3].year).to eq 1928
      expect(discoveries[3].small_planets).to eq 1
      expect(discoveries[3].medium_planets).to eq 0
      expect(discoveries[3].large_planets).to eq 0

      expect(discoveries[4].year).to eq 1936
      expect(discoveries[4].small_planets).to eq 1
      expect(discoveries[4].medium_planets).to eq 0
      expect(discoveries[4].large_planets).to eq 1

      expect(discoveries[5].year).to eq 1958
      expect(discoveries[5].small_planets).to eq 1
      expect(discoveries[5].medium_planets).to eq 0
      expect(discoveries[5].large_planets).to eq 1

      expect(discoveries[6].year).to eq 1968
      expect(discoveries[6].small_planets).to eq 0
      expect(discoveries[6].medium_planets).to eq 0
      expect(discoveries[6].large_planets).to eq 1

      expect(discoveries[7].year).to eq 1975
      expect(discoveries[7].small_planets).to eq 0
      expect(discoveries[7].medium_planets).to eq 1
      expect(discoveries[7].large_planets).to eq 0

      expect(discoveries[8].year).to eq 2001
      expect(discoveries[8].small_planets).to eq 1
      expect(discoveries[8].medium_planets).to eq 0
      expect(discoveries[8].large_planets).to eq 1
    end
  end
end
