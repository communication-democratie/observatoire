GoodJob::Engine.middleware.use(Rack::Auth::Basic) do |username, password|
  ActiveSupport::SecurityUtils.secure_compare(ENV["ADMIN_USER"], username) &
    ActiveSupport::SecurityUtils.secure_compare(ENV["ADMIN_PASSWORD"], password)
end
