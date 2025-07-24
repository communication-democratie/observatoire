class Admin::Problems::StepsController < Admin::ApplicationController
  before_action :set_step, only: %i[ show edit update destroy ]

  def index
    @steps = Problem::Step.ordered
  end

  def show
  end

  def new
    @step = Problem::Step.new
  end

  def edit
  end

  def create
    @step = Problem::Step.new(step_params)
    if @step.save
      redirect_to admin_problems_step_path(@step), notice: t('admin.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @step.update(step_params)
      redirect_to admin_problems_step_path(@step), notice: t('admin.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @step.destroy!
    redirect_to admin_problems_steps_path, status: :see_other, notice: t('admin.deleted')
  end

  private

    def set_step
      @step = Problem::Step.find(params.expect(:id))
    end

    def step_params
      params.expect(problem_step: [ :title, :description, :position, :color, :importance ])
    end
end
