# use mailcatcher to test locally
if ENV["STAGE"] == "prod"
  ActionMailer::Base.smtp_settings = {
    user_name: "apikey",
    password: ENV["SENDGRID_API_KEY"],
    domain: "abhinavnepal.com",
    address: "smtp.sendgrid.net",
    port: 587,
    authentication: :plain,
    enable_starttls_auto: true
  }
end
