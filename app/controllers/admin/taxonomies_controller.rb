class Admin::TaxonomiesController < Admin::ApplicationController
  before_action :set_taxonomy, only: %i[ show edit update destroy ]

  def index
    @taxonomies = Taxonomy.all
  end

  def show
  end

  def new
    @taxonomy = Taxonomy.new
  end

  def edit
  end

  def create
    @taxonomy = Taxonomy.new(taxonomy_params)
    if @taxonomy.save
      redirect_to [:admin, @taxonomy], notice: "Taxonomy was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @taxonomy.update(taxonomy_params)
      redirect_to [:admin, @taxonomy], notice: "Taxonomy was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @taxonomy.destroy!
    redirect_to admin_taxonomies_path, status: :see_other, notice: "Taxonomy was successfully destroyed."
  end

  private

  def set_taxonomy
    @taxonomy = Taxonomy.find(params.expect(:id))
  end

  def taxonomy_params
    params.expect(taxonomy: [ :title, :slug, :description, :position ])
  end
end
