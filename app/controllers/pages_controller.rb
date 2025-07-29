class PagesController < ApplicationController
  def index
    @problems =  Problem.for_home
    @report = Report.new
  end

  def show
    @page = Page.find_by!(slug: params[:slug])
  end
end
