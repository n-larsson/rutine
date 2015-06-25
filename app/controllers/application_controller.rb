class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate

  private

  def authenticate
    authenticate_or_request_with_http_token do |token, options|
      # NOTE: rack-test sends token as UTF-8, HTTP requests receive token as BINARY.
      token.b == Trine.secrets.authentication_token.b
    end
  end
end
