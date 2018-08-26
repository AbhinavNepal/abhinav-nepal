class ScholarTransition < ApplicationRecord

  extend Enumerize

  belongs_to :scholar, inverse_of: :scholar_transitions
  belongs_to :created_by, class_name: "Person"

  validates :scholar, :created_by, presence: true
  validates :to_state, inclusion: {in: ScholarStateMachine.states}

  before_validation :set_created_by
  after_destroy :update_most_recent, if: :most_recent?

  enumerize :to_state, in: ScholarStateMachine.states, predicates: true

  private

  def update_most_recent
    last_transition = scholar.scholar_transitions.order(:sort_key).last
    return unless last_transition.present?
    last_transition.update_column(:most_recent, true)
  end

  def set_created_by
    self.created_by_id ||= User.current&.person_id
  end

end
