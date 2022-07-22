# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnnualDiscoveries do
  describe 'year' do
    it 'returns unknowwn if 0' do
      discoveries = AnnualDiscoveries.new 0

      expect(discoveries.year).to eq 'Unknown'
    end

    it 'returns the year' do
      discoveries = AnnualDiscoveries.new 1988

      expect(discoveries.year).to eq 1988
    end
  end

  describe 'discover_plannet' do
    let(:discoveries) { AnnualDiscoveries.new 1999 }

    it 'can discover small planets' do
      num_planets = rand 1..20
      num_planets.times do
        discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(0.00001..1.0))
      end

      expect(discoveries.small_planets).to eq num_planets
      expect(discoveries.medium_planets).to eq 0
      expect(discoveries.large_planets).to eq 0
    end

    it 'can discover medium planets' do
      num_planets = rand 1..20
      num_planets.times do
        discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(1.0..2.0))
      end

      expect(discoveries.small_planets).to eq 0
      expect(discoveries.medium_planets).to eq num_planets
      expect(discoveries.large_planets).to eq 0
    end

    it 'can discover large planets' do
      num_planets = rand 1..20
      num_planets.times do
        discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(2.0..4.0))
      end

      expect(discoveries.small_planets).to eq 0
      expect(discoveries.medium_planets).to eq 0
      expect(discoveries.large_planets).to eq num_planets
    end

    it 'can discover small medium and large planets' do
      discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(0.00001..1.0))
      discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(1.0..2.0))
      discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(1.0..2.0))
      discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(2.0..4.0))
      discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(2.0..4.0))
      discoveries.discover_planet Exoplanet.new(RadiusJpt: rand(2.0..4.0))

      expect(discoveries.small_planets).to eq 1
      expect(discoveries.medium_planets).to eq 2
      expect(discoveries.large_planets).to eq 3
    end
  end
end
