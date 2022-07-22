# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExoplanetsDb do
  let(:exoplanets_json) { File.read Rails.root.join('spec/fixtures/exoplanets.json') }

  before(:each) do
    stub_request(:get,
                 'https://gist.githubusercontent.com/joelbirchler/66cf8045fcbb6515557347c05d789b4a/raw/9a196385b44d4288431eef74896c0512bad3defe/exoplanets').
        to_return(body: exoplanets_json)

    ExoplanetsDb.instance.instance_variable_set :@exoplanets, nil
  end

  describe 'exoplanets' do
    it 'only loads once if called multiple times' do
      allow(ExoplanetsDb.instance).to receive(:load).and_call_original

      ExoplanetsDb.instance.exoplanets
      expect(ExoplanetsDb.instance).to have_received(:load).exactly(1).times

      ExoplanetsDb.instance.exoplanets
      expect(ExoplanetsDb.instance).to have_received(:load).exactly(1).times
    end

    it 'reads from a website' do
      ExoplanetsDb.instance.exoplanets

      expect(WebMock).to have_requested(:get,
                                        'https://gist.githubusercontent.com/joelbirchler/66cf8045fcbb6515557347c05d789b4a/raw/9a196385b44d4288431eef74896c0512bad3defe/exoplanets')
    end

    it 'creates Exoplanet objects' do
      exoplanets = ExoplanetsDb.instance.exoplanets

      expect(exoplanets.length).to eq 13

      exoplanets.each do |exoplanet|
        expect(exoplanet).to be_a Exoplanet
      end
    end
  end

  describe 'reload' do
    it 'calls load even if called previously' do
      allow(ExoplanetsDb.instance).to receive(:load).and_call_original

      ExoplanetsDb.instance.exoplanets
      expect(ExoplanetsDb.instance).to have_received(:load).exactly(1).times

      ExoplanetsDb.instance.reload
      expect(ExoplanetsDb.instance).to have_received(:load).exactly(2).times
    end
  end
end
