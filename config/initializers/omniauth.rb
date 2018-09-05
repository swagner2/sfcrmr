OmniAuth.config.logger = Rails.logger

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :salesforce, '3MVG9i1HRpGLXp.rD5TEjStnIk6vMXPon0um2LewAQHO5iO36OOf8tRrXZfwejE3srI77RDNj0uonm0d32JGu', '4382521729899849539'
  end
