class WebUrl < ApplicationRecord

  belongs_to :linkable, polymorphic: true, optional: true

end
