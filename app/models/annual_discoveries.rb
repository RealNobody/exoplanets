# frozen_string_literal: true

class AnnualDiscoveries
  attr_accessor :discovery_year,
                :small_planets,
                :medium_planets,
                :large_planets

  def initialize(discovery_year)
    super()

    @discovery_year = discovery_year

    @small_planets  = 0
    @medium_planets = 0
    @large_planets  = 0
  end

  def year
    discovery_year.zero? ? I18n.t('unknown') : discovery_year
  end

  def discover_planet(planet)
    if planet.small?
      @small_planets += 1
    elsif planet.medium?
      @medium_planets += 1
    elsif planet.large?
      @large_planets += 1
    end
  end
end
