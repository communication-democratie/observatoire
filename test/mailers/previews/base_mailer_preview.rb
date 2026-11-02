class BaseMailerPreview < ActionMailer::Preview

  protected

  def report
    @report ||= Report.new(
      brand: "Marque de <p>test</p>",
      author_pseudonym: "John Smith",
      author_email: "john.smith@noesya.coop",
      step: Report::Step.new(
        title: "Étape de test",
        email_notification_active: true,
        email_notification_subject: "Votre signalement de {{brand}} a été mis à jour",
        email_notification_text: "Votre signalement de {{brand}} a été mis à jour en « Étape de test ».\nMerci."
      )
    )
  end

end
