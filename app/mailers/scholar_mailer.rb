class ScholarMailer < ApplicationMailer

  def review_scholars_digest
    @scholars = Scholar.with_state(:in_review).order(:created_at)
    return if @scholars.blank?

    mail to: User.with_role(:admin).pluck(:email)
  end

end
