module Greenbrick
  module Storage
    class Null
      def initialize
        @internal = {}
      end

      def keys
        @internal.keys
      end

      def []=(k,v)
        @internal[k] = v
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

    end
  end
end