class Organisation < ApplicationRecord

  # constant as most likely a fixed set of list.
  POSITION = ["PhD Candidate", "Research Assistant", "Postdoctoral Researcher",
              "Assistant Professor", "Associate Professor", "Reader", "Professor", "Lecturer",
              "Industry Research Scientist", "Industry Research Engineer"].freeze

  belongs_to :scholar

  validates :name, :position, :country_code, presence: true

  def to_s
    "#{position} at #{name}, #{country_name}"
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name
  end

end
