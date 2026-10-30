class AddEmailNotificationToReportSteps < ActiveRecord::Migration[8.1]
  def change
    add_column :report_steps, :email_notification_active, :boolean, default: false
    add_column :report_steps, :email_notification_subject, :string
    add_column :report_steps, :email_notification_text, :text
  end
end
