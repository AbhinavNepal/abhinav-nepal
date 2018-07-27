class ListItem < ApplicationRecord

  belongs_to :list, inverse_of: :list_items

  validates :label, :position, presence: true

  scope :in_list, -> (*list_codes) do
    joins(:list).where("lists.code" => [list_codes].flatten.map(&:to_s))
  end

  def to_s
    label
  end

end
