# frozen_string_literal: true

module Rubypost
  class AuthMiddleware < Faraday::Middleware
    def on_request(env)
      config = options[:config]
      env[:request_headers].merge!({
        "Authorization" => "AccessToken #{config.token}",
        "X-User-Authorization" => "Basic #{config.key || Base64.encode64("#{config.login}:#{config.password}")}"
      })
    end
  end
end
