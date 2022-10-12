module Auth
  AUTH_TOKEN = %r{\ABearer (?<token>.+)\z}

  def matched_token
    result = auth_header&.match(AUTH_TOKEN)
    return if result.blank?

    result[:token]
  end

  private

  def auth_header
    request.env['HTTP_AUTHORIZATION']
  end
end
