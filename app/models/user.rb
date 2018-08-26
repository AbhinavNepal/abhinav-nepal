class User < ApplicationRecord

  class << self

    def current=(user)
      RequestStore.store[:current_user] = user
    end

    def current
      RequestStore.store[:current_user]
    end

  end

  rolify strict: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :confirmable, :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  #      :registerable # disable sign_up

  belongs_to :person, inverse_of: :user

  before_validation :link_person, on: :create

  delegate :name, to: :person

  private

  def link_person
    self.person = Person.find_by(email: email)
  end

end
