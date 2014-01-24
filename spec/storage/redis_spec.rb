require 'spec_helper'
require 'redis'

describe Greenbrick::Storage::Redis do
  let( :key ) { 'greenbrick::storage::redis' }

  before( :each ) do
    client = Redis.new
    client.del key
  end

  after( :each ) do
    client = Redis.new
    client.del key
  end

  it 'should retrieve the keys that you store' do
    object = Greenbrick::Storage::Redis.new( key )
    object['key'] = 'value'
    expect( object['key'] ).to eq( 'value' )
  end

  it 'should return nil for a key that does not exist' do
    object = Greenbrick::Storage::Redis.new( key )

    expect( object['key'] ).to be_nil
  end

  it 'should support #each' do
    object = Greenbrick::Storage::Redis.new( key )
    object['key'] = 'value'

    object.each do |k,v|
      expect( k ).to eq( 'key' )
      expect( v ).to eq( 'value' )
    end
  end
end