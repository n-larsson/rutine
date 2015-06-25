module RequestSupport
  def authenticated_headers
    { "Authorization" => "Token #{Trine.secrets.authentication_token}" }
  end

  def response_json
    JSON.parse(response.body).with_indifferent_access
  end
end

RSpec.configure do |config|
  config.include(RequestSupport, type: :request)
end
