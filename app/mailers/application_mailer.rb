class ApplicationMailer < ActionMailer::Base
  default from: "#{ENV['MAIL_FROM_NAME']} <#{ENV['MAIL_FROM_MAIL']}>"
  layout "mailer"

  def default_url_options
    {
      host: ENV['SITE_URL'],
      port: Rails.env.development? ? 3000 : nil
    }
  end
end
