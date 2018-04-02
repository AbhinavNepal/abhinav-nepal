class WebUrl < ApplicationRecord

  extend Enumerize

  # constant as most likely a fixed set of list.
  PUBLICATION_SOURCES = ["Google Scholar", "Researchgate", "DBLP", "Other"].freeze
  PERSONAL_SOURCES = ["Personal", "Linkedin", "Facebook", "Twitter", "Other"].freeze

  belongs_to :linkable, polymorphic: true, optional: true

  validates :title, :url, presence: true

  enumerize :code, in: [:publication, :personal], predicates: true

end
