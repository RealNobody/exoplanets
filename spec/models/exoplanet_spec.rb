# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Exoplanet do
  let(:planet_hash) do
    { PlanetIdentifier: '<p>Single Small',
      TypeFlag:         0,
      RadiusJpt:        0.054,
      DiscoveryYear:    2001,
      HostStarTempK:    3588 }.with_indifferent_access
  end
  let(:exoplanet) { Exoplanet.new(planet_hash) }

  describe 'initialize' do
    it 'creates methods for the hash keys' do
      expect(exoplanet.PlanetIdentifier).to eq '<p>Single Small'
    end
  end

  describe 'orphaned?' do
    it 'is true if TypeFlag is 3' do
      planet_hash[:TypeFlag] = 3

      expect(exoplanet).to be_orphaned
    end

    it 'is false if TypeFlag is 0' do
      planet_hash[:TypeFlag] = 0

      expect(exoplanet).not_to be_orphaned
    end

    it 'is false if TypeFlag is 1' do
      planet_hash[:TypeFlag] = 1

      expect(exoplanet).not_to be_orphaned
    end

    it 'is false if TypeFlag is 2' do
      planet_hash[:TypeFlag] = 2

      expect(exoplanet).not_to be_orphaned
    end
  end

  describe 'host_star_temperature' do
    it 'is an integer of the passed in value' do
      planet_hash[:HostStarTempK] = '7853'

      expect(exoplanet.host_star_temperature).to eq 7853
    end

    it 'is 0 if unknown' do
      planet_hash[:HostStarTempK] = ''

      expect(exoplanet.host_star_temperature).to eq 0
    end
  end

  describe 'radius_jpt' do
    it 'is an float of the passed in value' do
      planet_hash[:RadiusJpt] = '0.015'

      expect(exoplanet.radius_jpt).to eq 0.015
    end

    it 'is 0 if unknown' do
      planet_hash[:RadiusJpt] = ''

      expect(exoplanet.radius_jpt).to eq 0.0
    end
  end

  describe 'small?' do
    it 'is true if radius is unknonwn' do
      planet_hash[:RadiusJpt] = ''

      expect(exoplanet).to be_small
    end

    it 'is true if radius < 1.0' do
      planet_hash[:RadiusJpt] = 0.9999999999

      expect(exoplanet).to be_small
    end

    it 'is false if radius = 1.0' do
      planet_hash[:RadiusJpt] = 1.0

      expect(exoplanet).not_to be_small
    end

    it 'is false if radius > 1.0' do
      planet_hash[:RadiusJpt] = 1.0000000001

      expect(exoplanet).not_to be_small
    end
  end

  describe 'medium?' do
    it 'is true if radius = 1.0' do
      planet_hash[:RadiusJpt] = 1.0

      expect(exoplanet).to be_medium
    end

    it 'is true if radius < 2.0' do
      planet_hash[:RadiusJpt] = 1.9999999999

      expect(exoplanet).to be_medium
    end

    it 'is false if radius is unknonwn' do
      planet_hash[:RadiusJpt] = ''

      expect(exoplanet).not_to be_medium
    end

    it 'is false if radius < 1.0' do
      planet_hash[:RadiusJpt] = 0.9999999999

      expect(exoplanet).not_to be_medium
    end

    it 'is false if radius = 2.0' do
      planet_hash[:RadiusJpt] = 2.0

      expect(exoplanet).not_to be_medium
    end

    it 'is false if radius > 2.0' do
      planet_hash[:RadiusJpt] = 2.0000000001

      expect(exoplanet).not_to be_medium
    end
  end

  describe 'large?' do
    it 'is true if radius = 2.0' do
      planet_hash[:RadiusJpt] = 2.0

      expect(exoplanet).to be_large
    end

    it 'is true if radius > 2.0' do
      planet_hash[:RadiusJpt] = 2.0000000001

      expect(exoplanet).to be_large
    end

    it 'is false if radius is unknonwn' do
      planet_hash[:RadiusJpt] = ''

      expect(exoplanet).not_to be_large
    end

    it 'is false if radius < 1.0' do
      planet_hash[:RadiusJpt] = 0.9999999999

      expect(exoplanet).not_to be_large
    end

    it 'is false if radius = 1.0' do
      planet_hash[:RadiusJpt] = 1.0

      expect(exoplanet).not_to be_large
    end

    it 'is false if radius < 2.0' do
      planet_hash[:RadiusJpt] = 1.9999999999

      expect(exoplanet).not_to be_large
    end
  end

  describe 'discovery_year' do
    it 'is 0 if unknown' do
      planet_hash[:DiscoveryYear] = ''

      expect(exoplanet.discovery_year).to eq 0
    end

    it 'is an integer if known' do
      planet_hash[:DiscoveryYear] = '1986'

      expect(exoplanet.discovery_year).to eq 1986
    end
  end
end
