# frozen_string_literal: true

class Exoplanet < Hashie::Mash
  def orphaned?
    self.TypeFlag == 3
  end

  def host_star_temperature
    self.HostStarTempK.to_i
  end

  def radius_jpt
    @radius_jpt ||= self.RadiusJpt.to_f
  end

  def small?
    radius_jpt < 1.0
  end

  def medium?
    !small? && radius_jpt < 2.0
  end

  def large?
    !small? && !medium?
  end

  def discovery_year
    self.DiscoveryYear.to_i
  end
end
