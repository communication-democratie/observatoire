class HomeController < ApplicationController
  def index
    @report = Report.new
  end
end
