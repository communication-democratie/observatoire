class ReportsMailer < ApplicationMailer
  default template_path: 'mailers/reports'

  def step_changed(report, step)
    @report = report
    @step = step
    email = @report.author_email
    return unless email.present?

    subject = @step.email_notification_subject.presence
    subject ||= "Mise à jour de votre signalement « #{@report.title} »"
    mail(to: email, subject: subject) if should_send?(email)
  end

end
