class Person < ApplicationRecord

  include NameFinder

  has_one :user, inverse_of: :person

  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: Devise.email_regexp

end
