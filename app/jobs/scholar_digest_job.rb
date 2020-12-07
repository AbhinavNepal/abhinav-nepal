class ScholarDigestJob < ApplicationJob

  queue_as :default
  sidekiq_options retry: 0

  def perform
    ScholarMailer.review_scholars_digest.deliver_now
  end

end
