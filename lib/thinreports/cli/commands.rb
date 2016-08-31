require 'thor'
require_relative 'command/upgrade'

module Thinreports
  module Cli
    class Commands < Thor
      desc 'upgrade', 'Upgrade .tlf to 0.9.x from 0.8.x.'
      def upgrade(source, destination)
        Command::Upgrade.new(source, destination).call
      end
    end
  end
end
