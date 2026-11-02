class ReportsMailer < ApplicationMailer
  default template_path: 'mailers/reports'

  def step_changed(report)
    @report = report
    email = @report.author_email
    return unless email.present?

    subject = @report.computed_step_changed_email_notification_subject
    mail(to: email, subject: subject) if should_send?(email)
  end

end
