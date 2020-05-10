class Scholar < ApplicationRecord

  extend Enumerize
  include NameFinder
  include Statesman::Adapters::ActiveRecordQueries[
    transition_class: ScholarTransition,
    initial_state: :in_review
  ]

  paginates_per 45

  belongs_to :discipline
  belongs_to :created_by, class_name: "Person"
  has_one :organisation
  has_many :web_urls, as: :linkable
  has_many :scholar_transitions, inverse_of: :scholar, dependent: :destroy

  scope :in_review, -> { with_state :in_review }

  accepts_nested_attributes_for :organisation, allow_destroy: true
  accepts_nested_attributes_for :web_urls, reject_if: :reject_web_urls?, allow_destroy: true
  accepts_nested_attributes_for :created_by

  before_validation :set_created_by, on: :create
  before_save :set_notes

  validates :first_name, :last_name, :discipline, presence: true

  enumerize :state, in: ScholarStateMachine.states, default: :in_review, predicates: true, scope: true

  delegate :can_transition_to?, :transition_to!, :transition_to, :current_state, to: :state_machine

  %i[publication personal].each do |code|
    define_method("build_#{code}_urls") do
      web_urls.build(code: code) if web_urls.none?(&:"#{code}?")
    end
  end

  def state_machine
    @state_machine ||= ScholarStateMachine.new(self, transition_class: ScholarTransition)
  end

  private

  def reject_web_urls?(attributes)
    attributes["code"] == "personal" &&
    (attributes["title"].blank? || attributes["url"].blank?)
  end

  def set_created_by
    self.created_by = User.current&.person || Person.find_by(email: created_by&.email) || created_by
  end

  def set_notes
    # notes is only applicable if a specific discipline
    # has not been provided, i.e. is other
    self.notes = nil unless discipline.other?
  end

end
