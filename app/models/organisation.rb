class Organisation < ApplicationRecord

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
