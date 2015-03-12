if Rails.env.production? or Rails.env.staging?
  Rails.application.config.middleware.swap(ActionDispatch::Static, Rack::Zippy::AssetServer)
end
