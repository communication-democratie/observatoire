class Brevo::SubscribeJob < ApplicationJob
  queue_as :default

  def perform(report)
    return unless report.author_email.present? && report.should_opt_in_newsletter?
    Brevo::ContactService.subscribe(report.author_email, report.should_opt_in_newsletter?)
  end
end
