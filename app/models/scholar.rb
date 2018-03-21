class Scholar < ApplicationRecord

  belongs_to :discipline
  has_many :web_urls, as: :linkable

  accepts_nested_attributes_for :web_urls, reject_if: :all_blank, allow_destroy: true

  validates :first_name, :last_name, :discipline, presence: true

  def name
    [first_name, middle_name, last_name].compact.join(" ")
  end

end
