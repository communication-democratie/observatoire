class Admin::ProblemsController < Admin::ApplicationController
  before_action :set_problem, only: %i[ show edit update destroy ]

  def index
    @problems = Problem.all
  end

  def show
  end

  def new
    @problem = Problem.new
  end

  def edit
  end

  def create
    @problem = Problem.new(problem_params)
    if @problem.save
      redirect_to [:admin, @problem], notice: t('admin.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @problem.update(problem_params)
      redirect_to [:admin, @problem], notice: t('admin.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @problem.destroy!
    redirect_to admin_problems_path, status: :see_other, notice: t('admin.deleted')
  end

  private

    def set_problem
      @problem = Problem.find(params.expect(:id))
    end

    def problem_params
      params.expect(problem: [ :title, :description, :image, category_ids: [] ])
    end
end
