class Scholar < ApplicationRecord

  belongs_to :discipline

  def name
    [first_name, last_name].compact.join(" ")
  end

end
