class Admin::PagesController < Admin::ApplicationController
  before_action :set_page, only: %i[ show edit update destroy ]

  def index
    @pages = Page.ordered
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to [:admin, @page], notice: t('admin.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @page.update(page_params)
      redirect_to [:admin, @page], notice: t('admin.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @page.destroy!
    redirect_to admin_pages_path, status: :see_other, notice: t('admin.deleted')
  end

  private

    def set_page
      @page = Page.find(params.expect(:id))
    end

    def page_params
      params.expect(page: [ :title, :slug, :markdown, :position ])
    end
end
