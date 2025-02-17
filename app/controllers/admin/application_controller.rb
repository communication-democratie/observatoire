class Admin::ApplicationController < ApplicationController
  http_basic_authenticate_with  name: ENV["ADMIN_USER"],
                                password: ENV["ADMIN_PASSWORD"] if ENV["ADMIN_USER"].present? && ENV["ADMIN_PASSWORD"].present?

  layout 'admin/layouts/application'
end