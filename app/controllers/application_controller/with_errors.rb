module ApplicationController::WithErrors
  extend ActiveSupport::Concern

  included do
    rescue_from ActionController::RoutingError do |exception|
      render_not_found
    end

    rescue_from ActionController::UnknownFormat do |exception|
      render_not_found
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render_not_found
    end

    rescue_from ActiveStorage::FileNotFoundError do |exception|
      render_not_found
    end

    def raise_404_unless(condition)
      raise ActionController::RoutingError.new('Not Found') unless condition
    end

    def handle_unverified_request
      redirect_back(fallback_location: root_path, alert: t('inactivity_alert'))
    end

    def render_not_found
      render file: Rails.root.join('public/404.html'), formats: [:html], status: 404, layout: false
    end
  end
end
