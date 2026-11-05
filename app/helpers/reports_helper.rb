module ReportsHelper
  def report_step_changed_computed_text(text, report)
    if report.problem
      problem_title = report.problem.to_s
      problem_link = problem_url(report.problem.slug, host: ENV["SITE_URL"])
      problem_advisers = report.problem.advertiser_categories.map(&:to_s).join(', ')
    else
      problem_title = "[pas de campagne]"
      problem_link = "[pas de campagne]"
      problem_advisers = "[pas de campagne]"
    end

    text
      .gsub("{{report_date}}", I18n.l(report.created_at.to_date, format: :long))
      .gsub("{{problem_title}}", Sanitizer.sanitize_string(report.problem.to_s))
      .gsub("{{problem_url}}", "<a href=\"#{problem_link}\">#{problem_link}</a>")
      .gsub("{{problem_advertisers}}", Sanitizer.sanitize_string(problem_advisers))
  end
end
