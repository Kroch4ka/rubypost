# frozen_string_literal: true

module Rubypost
  module Structs
    class Order < SymbolizedStruct
      attribute :id?, Types::Params::Integer.optional
      attribute :title?, Types::Params::String.optional
      attribute :position?, Types::Params::Integer.optional
      attribute :array_index?, Types::Params::Integer.optional
      attribute :created_at?, Types::Params::DateTime.optional
      attribute :updated_at?, Types::Params::DateTime.optional
      attribute :status?, Types::Params::String.optional
    end
  end
end
