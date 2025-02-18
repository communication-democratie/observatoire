class Admin::Reports::StepsController < Admin::ApplicationController
  before_action :set_report_step, only: %i[ show edit update destroy ]

  def index
    @steps = Report::Step.ordered
  end

  def show
  end

  def new
    @step = Report::Step.new
  end

  def edit
  end

  def create
    @step = Report::Step.new(problem_params)
    if @step.save
      redirect_to admin_reports_step_path(@step), notice: t('admin.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @step.update(problem_params)
      redirect_to admin_reports_step_path(@step), notice: t('admin.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @step.destroy!
    redirect_to admin_reports_steps_path, status: :see_other, notice: t('admin.deleted')
  end

  private

    def set_report_step
      @step = Report::Step.find(params.expect(:id))
    end

    def problem_params
      params.expect(report_step: [ :title, :description, :position ])
    end
end
