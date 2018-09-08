

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :goodreads2, ENV['GOODREADS_KEY'], ENV['GOODREADS_SECRET']
end
