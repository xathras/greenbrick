require 'yaml'

module Greenbrick
  module Storage
    class Yaml
      attr_reader :filename
      
      def initialize( filename )
        @filename = filename
        @internal = if File.exists?( filename )
          YAML.load( File.open( filename ) )
        else
          {}
        end
      end

      def keys
        @internal.keys
      end

      def []=(k,v)
        @internal[k] = v
        store
      end

      def [](k)
        @internal[k]
      end

      def each
        @internal.each
      end

      def map
        @internal.map
      end

      def length
        @internal.length
      end

    private
      def store
        File.open(@filename, "w") {|f| f.write(@internal.to_yaml) }
      end
    end
  end
end