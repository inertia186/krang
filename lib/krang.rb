require 'radiator'
require 'awesome_print'
require 'yaml'
# require 'pry'

Bundler.require

module Krang
  require 'krang/chain'
  
  include Chain
  
  extend self
end