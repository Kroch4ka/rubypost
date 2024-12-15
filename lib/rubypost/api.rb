# frozen_string_literal: true

module Rubypost
  class API
    Result = Struct.new(:headers, :result, :raw, :status, :ok)

    include Dry::Configurable

    setting :address, default: "otpravka-api.pochta.ru"
    setting :token
    setting :login
    setting :password
    setting :key

    def call(request)
      response = connection.send(request.http_method, request.uri, request.params)
      Result.new(
        headers: response.headers,
        result: build_response_object(request, response.body),
        raw: response.body,
        status: response.status,
        ok: true
      )
    rescue StandardError => e
      Result.new(headers: response&.headers, status: response.status, ok: false, error: e.message)
    end

    def configure
      super
      @connection = Faraday.new("https://#{config.address}") do |f|
        f.request :json
        f.response :json
        f.response :raise_error
        f.response :logger
        f.use AuthMiddleware, config:
      end
      self
    end

    private

    attr_reader :connection

    def build_response_object(request, body)
      return body.map { request.build_response_object(_1) } if body.is_a?(Array)

      request.build_response_object(body)
    end
  end
end
