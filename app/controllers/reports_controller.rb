class ReportsController < ApplicationController
  def create
    @report = Report.create(report_params)
    if @report.valid?
      redirect_to root_path, notice: "Merci pour ce signalement !"
    else
      render 'pages/index'
    end
  end

  private

  def report_params
    params.expect(report: [ 
      :title, :description, :link, :image, :brand,
      :author_pseudonym, :author_email, files: [],
      category_ids: []
    ])
  end
end
