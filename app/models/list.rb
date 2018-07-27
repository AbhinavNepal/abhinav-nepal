class List < ApplicationRecord

  has_many :list_items, inverse_of: :list

  validates :code, presence: true

end
