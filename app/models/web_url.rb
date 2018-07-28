class WebUrl < ApplicationRecord

  extend Enumerize

  belongs_to :linkable, polymorphic: true, optional: true

  validates :title, :url, presence: true

  enumerize :code, in: [:publication, :personal], predicates: true

end
