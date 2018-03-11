class Discipline < ApplicationRecord

  has_closure_tree

  has_many :self_and_descendants, through: :descendant_hierarchies, source: :descendant
  has_many :self_and_ancestors, through: :ancestor_hierarchies, source: :ancestor

  def to_s
    title
  end

end
