class Scholar < ApplicationRecord

  belongs_to :discipline
  belongs_to :institute, optional: true
  has_many :web_urls, as: :linkable

  accepts_nested_attributes_for :web_urls, reject_if: :all_blank, allow_destroy: true

  validates :first_name, :last_name, :discipline, presence: true

  attr_reader :institute_token

  def name
    [first_name, middle_name, last_name].compact.join(" ")
  end

  def institute_token=(token)
    val = token.split(",")
    return if val.blank?
    self.institute = Institute.find_or_create_by name: val[0], country: val[1]
  end

end
