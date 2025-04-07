class ProblemsController < ApplicationController
  def index
    @problems = Problem.all
    @taxonomies = Taxonomy.ordered
    breadcrumb
  end

  def show
    @problem = Problem.find(params.expect(:id))
    breadcrumb
    add_breadcrumb @problem
  end

  protected

  def breadcrumb
    super
    add_breadcrumb Problem.model_name.human(count: 2), problems_path
  end
end
