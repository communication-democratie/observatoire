class ApplicationController < ActionController::Base
  http_basic_authenticate_with  name: ENV["USER"],
                                password: ENV["PASSWORD"] if ENV["USER"].present? && ENV["PASSWORD"].present?
  include WithErrors

  def breadcrumb
    add_breadcrumb t('front.home'), root_path
  end
end
