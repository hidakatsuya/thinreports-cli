require 'json'

module Thinreports
  module Cli
    module Commands
      class Upgrade
        DESTINATION_VERSION = '0.9.0'

        def initialize(source, destination)
          @source = source
          @destination = destination
        end

        def call
          schema = load_source_schema
          error "The source version v#{schema['version']} is not upgradable." unless upgradable?(schema['version'])

          upgraded_schema = LegacySchemaUpgrader.new(schema).upgrade
          File.write(destination, JSON.pretty_generate(upgraded_schema), encoding: 'UTF-8')
        end

        private

        attr_reader :source, :destination

        def upgradable?(source_version)
          source_version >= '0.8.0' && source_version < DESTINATION_VERSION
        end

        def load_source_schema
          error "No such file - #{source}" unless File.exist?(source)
          JSON.parse(File.read(source, encoding: 'UTF-8'))
        end

        def error(message)
          raise Thor::Error, message
        end

        class LegacySchemaUpgrader < Thinreports::Layout::LegacySchema
          def upgrade
            super.merge 'version' => DESTINATION_VERSION
          end

          def list_item_schema(legacy_element)
            super.merge(
              'x' => legacy_element.attributes['x'].to_f,
              'y' => legacy_element.attributes['y'].to_f,
              'width' => legacy_element.attributes['width'].to_f,
              'height' => legacy_element.attributes['height'].to_f
            )
          end
        end
      end
    end
  end
end
