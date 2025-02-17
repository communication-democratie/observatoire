class CategoriesController < ApplicationController
  def index
    @taxonomy = Taxonomy.find_by(slug: params[:taxonomy_slug])
    @categories = @taxonomy.categories.ordered
    breadcrumb
  end

  def show
    @taxonomy = Taxonomy.find_by(slug: params[:taxonomy_slug])
    @category = Category.find_by(slug: params[:category_slug])
    breadcrumb
  end
  
  protected

  def breadcrumb
    super
    add_breadcrumb @taxonomy, taxonomy_path(taxonomy_slug: @taxonomy.slug) if @taxonomy
    add_breadcrumb @category, category_path(taxonomy_slug: @taxonomy.slug, category_slug: @category.slug) if @category
  end
end
