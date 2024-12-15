# frozen_string_literal: true

module Rubypost
  class SymbolizedStruct < Dry::Struct
    transform_keys(&:to_sym)
  end
end
