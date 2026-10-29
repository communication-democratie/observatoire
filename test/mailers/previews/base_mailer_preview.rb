class BaseMailerPreview < ActionMailer::Preview

  protected

  def report
    @report ||= Report.new(
      brand: "Marque de test",
      author_pseudonym: "John Smith",
      author_email: "john.smith@noesya.coop",
      step: Report::Step.new(title: "Étape de test")
    )
  end

end
