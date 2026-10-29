# Preview all emails at http://localhost:3000/rails/mailers/reports_mailer

class ReportsMailerPreview < BaseMailerPreview

  # Preview this email at http://localhost:3000/rails/mailers/reports_mailer/step_changed
  def step_changed
    ReportsMailer.step_changed(report)
  end

end
