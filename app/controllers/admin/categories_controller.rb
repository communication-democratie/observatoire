class Admin::CategoriesController < Admin::ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
    @category.taxonomy_id = params[:taxonomy_id]
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, @category], notice: t('admin.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to [:admin, @category], notice: t('admin.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
    redirect_to admin_categories_path, status: :see_other, notice: t('admin.deleted')
  end

  private

    def set_category
      @category = Category.find(params.expect(:id))
    end

    def category_params
      params.expect(category: [ :title, :slug, :taxonomy_id, :description, :position ])
    end
end
