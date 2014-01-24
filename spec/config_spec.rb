require 'spec_helper'

describe Greenbrick::Config do
  it 'should store and return values' do
    config = Greenbrick::Config.new
    config['s3_bucket'] = 'bucket_name'

    expect( config['s3_bucket'] ).to eq( 'bucket_name' )
  end

  it 'should accept a storage engine' do
    config = Greenbrick::Config.new Greenbrick::Storage::Yaml.new( 'greenbrick_config.yml' )

    config['s3_bucket'] = 'bucket_name'

    expect( config['s3_bucket'] ).to eq( 'bucket_name' )

    File.delete( 'greenbrick_config.yml' )if File.exists?( 'greenbrick_config.yml' )
  end
end