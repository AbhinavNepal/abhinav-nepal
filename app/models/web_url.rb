class WebUrl < ApplicationRecord

  belongs_to :linkable, polymorphic: true, optional: true

  validates :title, :url, presence: true

end
