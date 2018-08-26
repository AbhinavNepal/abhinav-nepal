module NameFinder

  extend ActiveSupport::Concern

  included do
    ransacker :name do |parent|
      Arel::Nodes::NamedFunction.new "concat", [parent.table[:first_name], Arel::Nodes.build_quoted(" "), parent.table[:last_name]]
    end
  end

  def name
    [first_name, last_name].reject(&:blank?).map(&:strip).join(" ")
  end

end
