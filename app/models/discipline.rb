class Discipline < ApplicationRecord

  has_closure_tree

  has_many :self_and_descendants, through: :descendant_hierarchies, source: :descendant
  has_many :self_and_ancestors, through: :ancestor_hierarchies, source: :ancestor

  validates :title, :code, uniqueness: {case_sensitive: false}

  def to_s
    title
  end

  def root
    if self_and_ancestors.loaded?
      self_and_ancestors.find { |disc| disc.parent_id.nil? }
    else
      super
    end
  end

end
