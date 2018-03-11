class Discipline < ApplicationRecord

  has_closure_tree

  def to_s
    title
  end

end
