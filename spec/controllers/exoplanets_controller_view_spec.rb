# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExoplanetsController do
  let(:exoplanets_json) { File.read Rails.root.join('spec/fixtures/exoplanets.json') }
  let(:page) do
    exo_page = Pages::ExoplanetsIndex.new

    exo_page.load(response.body)

    exo_page
  end

  render_views(true)

  before(:each) do
    allow(ExoplanetsDb.instance).to receive(:json).and_return exoplanets_json
    ExoplanetsDb.instance.reload
  end

  describe 'index' do
    it 'renders' do
      get :index

      expect(response).to be_successful
      expect(response.body).to be
    end

    it 'renders total_orphaned' do
      get :index

      expect(response).to be_successful
      expect(page.total_orphaned.text).to eq '3'
    end

    it 'renders hottest' do
      get :index

      expect(response).to be_successful
      expect(page.hottest.text.strip).to eq '<p>SType Large'
    end

    it 'renders multiple hottest' do
      allow(ExoplanetsDb.instance).to receive(:json).and_return exoplanets_json.gsub('3591', '13584')
      ExoplanetsDb.instance.reload

      get :index

      expect(response).to be_successful
      expect(page.hottest.text.strip).to eq "<p>Orphan Large\n          \n        <p>SType Large"
    end

    it 'renders timeline' do
      get :index

      expect(response).to be_successful

      expect(page.discoveries.length).to eq 9

      expect(page.discoveries[0].year.text).to eq 'Unknown'
      expect(page.discoveries[0].small.text).to eq '1'
      expect(page.discoveries[0].medium.text).to eq '0'
      expect(page.discoveries[0].large.text).to eq '0'

      expect(page.discoveries[1].year.text).to eq '1902'
      expect(page.discoveries[1].small.text).to eq '0'
      expect(page.discoveries[1].medium.text).to eq '2'
      expect(page.discoveries[1].large.text).to eq '0'

      expect(page.discoveries[2].year.text).to eq '1927'
      expect(page.discoveries[2].small.text).to eq '0'
      expect(page.discoveries[2].medium.text).to eq '1'
      expect(page.discoveries[2].large.text).to eq '0'

      expect(page.discoveries[3].year.text).to eq '1928'
      expect(page.discoveries[3].small.text).to eq '1'
      expect(page.discoveries[3].medium.text).to eq '0'
      expect(page.discoveries[3].large.text).to eq '0'

      expect(page.discoveries[4].year.text).to eq '1936'
      expect(page.discoveries[4].small.text).to eq '1'
      expect(page.discoveries[4].medium.text).to eq '0'
      expect(page.discoveries[4].large.text).to eq '1'

      expect(page.discoveries[5].year.text).to eq '1958'
      expect(page.discoveries[5].small.text).to eq '1'
      expect(page.discoveries[5].medium.text).to eq '0'
      expect(page.discoveries[5].large.text).to eq '1'

      expect(page.discoveries[6].year.text).to eq '1968'
      expect(page.discoveries[6].small.text).to eq '0'
      expect(page.discoveries[6].medium.text).to eq '0'
      expect(page.discoveries[6].large.text).to eq '1'

      expect(page.discoveries[7].year.text).to eq '1975'
      expect(page.discoveries[7].small.text).to eq '0'
      expect(page.discoveries[7].medium.text).to eq '1'
      expect(page.discoveries[7].large.text).to eq '0'

      expect(page.discoveries[8].year.text).to eq '2001'
      expect(page.discoveries[8].small.text).to eq '1'
      expect(page.discoveries[8].medium.text).to eq '0'
      expect(page.discoveries[8].large.text).to eq '1'
    end
  end
end
