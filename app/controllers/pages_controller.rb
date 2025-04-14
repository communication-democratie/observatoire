class PagesController < ApplicationController
  def index
    @report = Report.new
  end

  def show
    @page = Page.find_by!(slug: params[:slug])
  end
end
