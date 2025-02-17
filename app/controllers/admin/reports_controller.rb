class Admin::ReportsController < Admin::ApplicationController
  def index
    @reports = Report.all.ordered
  end

  def show
    @report = Report.find(params.expect(:id))
  end
end
