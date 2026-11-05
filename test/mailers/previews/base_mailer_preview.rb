class BaseMailerPreview < ActionMailer::Preview

  protected

  def report
    @report ||= begin
      report = Report.joins(:step).where(report_steps: { email_notification_active: true }).first
      report.author_email = "john.smith@noesya.coop"
      report
    end
  end

end
