# frozen_string_literal: true

class HottestStars
  def hottest
    exoplanets          = ExoplanetsDb.instance.exoplanets
    hottest_temperature = exoplanets.max_by(&:host_star_temperature).host_star_temperature

    exoplanets.select { |exoplanet| exoplanet.host_star_temperature == hottest_temperature }.sort_by(&:PlanetIdentifier)
  end
end
