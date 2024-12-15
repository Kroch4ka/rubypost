# frozen_string_literal: true

module Rubypost
  module Requests
    module Orders
      class Create < Base
        def uri = "2.0/user/backlog"
        def http_method = :put
        def build_response_object(_object) = raise NotImplementedError
      end
    end
  end
end
