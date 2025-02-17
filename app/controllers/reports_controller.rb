class ReportsController < ApplicationController
  def create
    @report = Report.new(report_params)
    redirect_to root_path, notice: "Merci !"
  end

  private

  def report_params
    params.expect(report: [ :title, :description, :author_pseudonym, :author_place, :author_contact ])
  end
end
