class Institute < ApplicationRecord

  def to_s
    "#{name}, #{country}"
  end

end
