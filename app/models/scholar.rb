class Scholar < ApplicationRecord

  belongs_to :discipline
  belongs_to :institute, optional: true
  has_one :organisation
  has_many :web_urls, as: :linkable

  accepts_nested_attributes_for :organisation, allow_destroy: true
  accepts_nested_attributes_for :web_urls, reject_if: :reject_web_urls?, allow_destroy: true

  ransacker :name do |parent|
    Arel::Nodes::NamedFunction.new "concat", [parent.table[:first_name], Arel::Nodes.build_quoted(" "), parent.table[:last_name]]
  end

  validates :first_name, :last_name, :discipline, presence: true

  def name
    [first_name, last_name].reject(&:blank?).map(&:strip).join(" ")
  end

  private

  def reject_web_urls?(attributes)
    attributes["code"] == "personal" &&
    (attributes["title"].blank? || attributes["url"].blank?)
  end

end
