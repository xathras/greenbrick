require 'spec_helper'

describe Greenbrick::Storage::Null do
  it 'should start without any keys' do
    object = Greenbrick::Storage::Null.new
    expect( object.keys ).to be_empty
  end

  it 'should retrieve the keys that you store' do
    object = Greenbrick::Storage::Null.new
    object['key'] = 'value'
    expect( object['key'] ).to eq( 'value' )
  end

  it 'should return nil for a key that does not exist' do
    object = Greenbrick::Storage::Null.new

    expect( object['key'] ).to be_nil
  end

  it 'should support #each' do
    object = Greenbrick::Storage::Null.new
    object['key'] = 'value'

    object.each do |k,v|
      expect( k ).to eq( 'key' )
      expect( v ).to eq( 'value' )
    end
  end
end