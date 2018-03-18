class Scholar < ApplicationRecord

  belongs_to :discipline

  validates :first_name, :last_name, :discipline, presence: true

  def name
    [first_name, middle_name, last_name].compact.join(" ")
  end

end
