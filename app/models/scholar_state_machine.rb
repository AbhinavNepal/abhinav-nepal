class ScholarStateMachine

  include Statesman::Machine

  state :in_review, initial: true
  state :approved
  state :declined

  transition from: :in_review, to: [:approved, :declined]
  transition from: :declined,  to: :in_review
  # TODO: approved scholars can be edited.
  #       add appropriate transitions for such scenarios.

  guard_transition(to: :declined) do |scholar|
    # TODO: validate feedback/reason supplied
  end

  after_transition(to: :declined) do |scholar, transition|
    # TODO: trigger mail to the person who added the scholar
    #       with feedback/reason on why it was declined
  end

  after_transition do |scholar, transition|
    # also store current state on model directly
    scholar.update_columns state: transition.to_state
  end

end
