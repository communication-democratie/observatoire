class PagesController < ApplicationController
  def index
    @problems =  Problem.important
                        .ordered
                        .limit(4)
    @report = Report.new
  end

  def show
    @page = Page.find_by!(slug: params[:slug])
  end
end
