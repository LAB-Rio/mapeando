if Rails.env.production? || Rails.env.staging?
  Rails.application.config.middleware.swap(ActionDispatch::Static, Rack::Zippy::AssetServer)
end
