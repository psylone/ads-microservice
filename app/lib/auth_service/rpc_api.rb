module AuthService
  module RpcApi
    def auth(token)
      payload = token.to_json
      publish(payload, type: 'token')
    end
  end
end
