class ReportsMailer < ApplicationMailer
  include ReportsHelper

  default template_path: 'mailers/reports'
  helper :reports

  def step_changed(report, step)
    @report = report
    @step = step
    email = @report.author_email
    return unless email.present?

    subject = report_step_changed_computed_text(@step.email_notification_subject, report)
    mail(to: email, subject: subject) if should_send?(email)
  end

end
