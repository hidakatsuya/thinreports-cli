require 'thor'
require_relative 'commands/upgrade'

module Thinreports
  module Cli
    class Application < Thor
      desc 'upgrade', 'Upgrade .tlf to 0.9.x from 0.8.x.'
      def upgrade(source, destination)
        Commands::Upgrade.new(source, destination).call
      end
    end
  end
end
