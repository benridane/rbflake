require "rbflake/version"
require "rbflake/boundary_flake"

module Rbflake
  # Your code goes here...
    def self.new
        @flake = BoundaryFlake.new
    end
end
