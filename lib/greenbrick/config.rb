module Greenbrick
  class Config
    def initialize( storage = Greenbrick::Storage::Null.new )
      @storage = storage
    end

    def []=(key,value)
      @storage[key] = value
    end

    def [](key)
      @storage[key]
    end
  end
end