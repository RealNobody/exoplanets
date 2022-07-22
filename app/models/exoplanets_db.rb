# frozen_string_literal: true

class ExoplanetsDb
  include Singleton

  def exoplanets
    @exoplanets ||= load
  end

  def reload
    @exoplanets = nil
    exoplanets
  end

  private

  EXOPLANETS_SITE = 'https://gist.githubusercontent.com'
  EXOPLANETS_FILE = '/joelbirchler/66cf8045fcbb6515557347c05d789b4a/raw/9a196385b44d4288431eef74896c0512bad3defe/exoplanets'

  def json
    conn     = Faraday.new(url: ExoplanetsDb::EXOPLANETS_SITE, headers: { 'Content-Type' => 'application/json' })
    response = conn.get(ExoplanetsDb::EXOPLANETS_FILE)

    raise "Could not load exoplanets" unless response.success?

    response.body
  end

  def load
    JSON.parse(json).map { |exoplanet| Exoplanet.new(exoplanet) }
  rescue
    nil
  end
end
