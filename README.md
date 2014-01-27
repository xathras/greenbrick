# Greenbrick

This gem provides an abstraction layer over key value stores such as YAML or Redis. The original application is as an application configuration store to migrate from local YAML files to a centralized Redis configuration store.

## Installation

Add this line to your application's Gemfile:

    gem 'greenbrick'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install greenbrick

## Usage

    # store as an in-memory hash
    app_config = Greenbrick::Config.new Greenbrick::Storage::Null.new
 
    app_config['s3_bucket'] = 'bucket_name' # => 'bucket_name'
 
    app_config['s3_bucket'] # => 'bucket_name'
 
    app_config.each do |k,v|
      puts "#{k}: #{v}"
    end
    # "s3_bucket: bucket_name"
 
    app_config = Greenbrick::Config.new Greenbrick::Storage::Yaml.new( 'config/config.yml' )
 
    app_config = Greenbrick::Config.new( Greenbrick::Storage::Redis.new( 'key' , { host: 'localhost' , port: 123456 } ) )

## Contributing

1. Fork it ( http://github.com/<my-github-username>/greenbrick/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
