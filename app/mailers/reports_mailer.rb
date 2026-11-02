class ReportsMailer < ApplicationMailer
  default template_path: 'mailers/reports'

  def step_changed(report)
    @report = report
    email = @report.author_email
    return unless email.present?

    subject = @report.step.email_notification_subject
    subject = subject.gsub('{{brand}}', Sanitizer.sanitize_string(@report.brand))
    mail(to: email, subject: subject) if should_send?(email)
  end

end
