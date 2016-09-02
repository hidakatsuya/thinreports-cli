require 'json'

module Thinreports
  module Cli
    module Commands
      class Upgrade
        DESTINATION_VERSION = '0.9.0'

        def initialize(source_path, destination_path)
          @source_path = source_path
          @destination_path = destination_path
        end

        def call
          source_schema = load_source_schema
          error "The source version v#{source_schema['version']} is not upgradable." unless upgradable?(source_schema['version'])

          upgraded_schema = LegacySchemaUpgrader.new(source_schema).upgrade
          File.write(destination_path, JSON.pretty_generate(upgraded_schema), encoding: 'UTF-8')
        end

        private

        attr_reader :source_path, :destination_path

        def upgradable?(source_version)
          source_version >= '0.8.0' && source_version < DESTINATION_VERSION
        end

        def load_source_schema
          error "No such file - #{source_path}" unless File.exist?(source_path)
          JSON.parse(File.read(source_path, encoding: 'UTF-8'))
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
