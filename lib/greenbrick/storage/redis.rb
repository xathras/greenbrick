require 'redis'

module Greenbrick
  module Storage
    class Redis
      def initialize( key_space , redis_client_options = {} )
        @key_space = key_space
        @client = ::Redis.new redis_client_options
      end

      def []=(key,value)
        @client.hset @key_space , key , value
      end

      def [](key)
        @client.hget @key_space , key
      end

      def each
        hash.each
      end

      def length
        hash.length
      end

    private
      def hash
        @client.hgetall @key_space
      end
    end
  end
end