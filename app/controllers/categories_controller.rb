class CategoriesController < ApplicationController
  before_action :load_taxonomy

  def index
    @categories = @taxonomy.categories.ordered
    breadcrumb
  end

  def show
    @category = Category.find_by!(slug: params[:category_slug])
    breadcrumb
  end

  protected

  def load_taxonomy
    @taxonomy = Taxonomy.find_by!(slug: params[:taxonomy_slug])
  end

  def breadcrumb
    super
    add_breadcrumb @taxonomy, taxonomy_path(taxonomy_slug: @taxonomy.slug)
    add_breadcrumb @category, category_path(taxonomy_slug: @taxonomy.slug, category_slug: @category.slug) if @category
  end
end
