require 'colorize'
require 'pathname'
require_relative 'gotham/version.rb'
require_relative 'gotham/map.rb'
require_relative 'gotham/all_players.rb'
module Gotham
  def self.version
    Gotham::VERSION
  end

  def self.base_regions
    [["Downtown",      "GCPD"        ],
     ["Arkham Asylum", "Secret Cave" ] ]
  end
end
