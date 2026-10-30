class AddShouldOptInNewsletterToReports < ActiveRecord::Migration[8.1]
  def change
    add_column :reports, :should_opt_in_newsletter, :boolean, default: false
    add_column :reports, :should_opt_in_pixel_tracking, :boolean, default: false
  end
end
