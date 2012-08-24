Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '7f3b06ca4e81ad3e7846', '35dd7f0ec6e5b5ddb652ba87a7fa78503f7ffe16', :scope => 'user'
end

OmniAuth.config.logger = Rails.logger
