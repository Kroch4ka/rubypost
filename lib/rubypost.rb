# frozen_string_literal: true

require_relative "rubypost/version"

require "zeitwerk"
require "dry-configurable"
require "faraday"
require "dry-struct"
require "base64"

loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/insulin.rb")
loader.inflector.inflect("api" => "API")
loader.setup

module Rubypost
  
end
