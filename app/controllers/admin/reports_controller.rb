class Admin::ReportsController < Admin::ApplicationController
  before_action :set_report, only: %i[ show edit update ]

  def index
    @reports = Report.all.ordered
  end

  def show
  end

  def edit
  end

  def update
    if @report.update(report_params)
      redirect_to [:admin, @report], notice: t('admin.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  protected

  def set_report
    @report = Report.find(params.expect(:id))
  end

  def report_params
    params.expect(report: [ :problem_id ])
  end
end
