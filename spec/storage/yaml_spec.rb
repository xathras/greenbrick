require 'spec_helper'

describe Greenbrick::Storage::Yaml do
  let( :filename ) { 'test.yml' }

  before( :each ) do
    File.delete( filename ) if File.exists?( filename )
  end

  after( :each ) do
    File.delete( filename ) if File.exists?( filename )
  end

  it 'should retrieve the keys that you store' do
    object = Greenbrick::Storage::Yaml.new( filename )
    object['key'] = 'value'
    expect( object['key'] ).to eq( 'value' )
  end

  it 'should return nil for a key that does not exist' do
    object = Greenbrick::Storage::Yaml.new( filename )

    expect( object['key'] ).to be_nil
  end

  it 'should support #each' do
    object = Greenbrick::Storage::Yaml.new( filename )
    object['key'] = 'value'

    object.each do |k,v|
      expect( k ).to eq( 'key' )
      expect( v ).to eq( 'value' )
    end
  end
end