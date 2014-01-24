require 'redis'

module Greenbrick
  module Storage
    class Redis
      def initialize( key_space , redis_client_options = {} )
        @key_space = key_space
        @client = ::Redis.new redis_client_options
        @cache
      end

      def []=(key,value)
        @client.hset @key_space , key , value
        recache
      end

      def [](key)
        @client.hget @key_space , key
      rescue BaseConnectionError
        @cache[key]
      end

      def each
        recache
        @cache.each
      end

      def length
        recache
        @cache.length
      end

    private
      def recache
        @cache = @client.hgetall @key_space
      rescue BaseConnectionError
        @cache
      end
    end
  end
end