class ProblemsController < ApplicationController
  def index
    @facets = Problem::Facets.new params[:facets]
    @problems = @facets.results.ordered.page params[:page]
    breadcrumb
    add_breadcrumb 'Publicités signalées', problems_path
  end

  def analyzed
    @categories = Taxonomy.find_by(slug: 'mauvaises-pratiques')
                          .categories
                          .ordered
    breadcrumb
    add_breadcrumb 'Nos analyses'
  end

  def show
    @problem = Problem.find(params.expect(:id))
    breadcrumb
    if @problem.important?
      add_breadcrumb 'Nos analyses', analyzed_problems_path
    else
      add_breadcrumb 'Publicités signalées', problems_path
    end
    add_breadcrumb @problem
  end
end
