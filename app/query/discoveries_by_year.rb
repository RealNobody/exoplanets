# frozen_string_literal: true

class DiscoveriesByYear
  include Singleton

  def annual_discoveries
    @annual_discoveries ||= ExoplanetsDb.instance.exoplanets.each_with_object({}) do |exoplanet, discoveries|
      discovery_year = exoplanet.discovery_year

      discoveries[discovery_year] ||= AnnualDiscoveries.new(discovery_year)

      current_discovieries = discoveries[discovery_year]
      current_discovieries.discover_planet(exoplanet)
    end.sort.map { |(_key, value)| value }
  end
end
