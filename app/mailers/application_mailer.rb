class ApplicationMailer < ActionMailer::Base

  default from: -> { t("mailer.from") },
          reply_to: -> { t("mailer.reply_to") }

  layout 'mailer'

end
