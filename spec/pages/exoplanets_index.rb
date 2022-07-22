# frozen_string_literal: true

module Pages
  class ExoplanetsIndex < SitePrism::Page
    element :total_orphaned, '.total-orphaned'
    element :hottest, '.hottest-star tr td:nth-of-type(2)'

    sections :discoveries, '.planetary-discoveries tbody tr' do
      element :year, 'td:nth-of-type(1)'
      element :small, 'td:nth-of-type(2)'
      element :medium, 'td:nth-of-type(3)'
      element :large, 'td:nth-of-type(4)'
    end
  end
end
