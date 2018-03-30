class Scholar < ApplicationRecord

  belongs_to :discipline
  belongs_to :institute, optional: true
  has_one :organisation
  has_many :web_urls, as: :linkable

  accepts_nested_attributes_for :organisation, allow_destroy: true
  accepts_nested_attributes_for :web_urls, allow_destroy: true

  validates :first_name, :last_name, :discipline, presence: true

  def name
    [first_name, middle_name, last_name].compact.join(" ")
  end

end
