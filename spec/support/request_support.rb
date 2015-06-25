module RequestSupport
  def authenticated_headers
    { "Authorization" => "Token #{Trine.secrets.authentication_token}" }
  end
end

RSpec.configure do |config|
  config.include(RequestSupport, type: :request)
end
