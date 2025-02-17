class ApplicationController < ActionController::Base
  http_basic_authenticate_with  name: ENV["USER"],
                                password: ENV["PASSWORD"] if ENV["USER"].present? && ENV["PASSWORD"].present?
  include WithErrors
end
