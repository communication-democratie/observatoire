class ReportsController < ApplicationController
  def create
    @report = Report.create(report_params)
    redirect_to root_path, notice: "Merci pour ce signalement !"
  end

  private

  def report_params
    params.expect(report: [ 
      :title, :description, :link, :image,
      :author_pseudonym, :author_contact,
      category_ids: []
    ])
  end
end
