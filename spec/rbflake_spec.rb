require 'spec_helper'

describe Rbflake do

  it 'has a version number' do
    expect(Rbflake::VERSION).not_to be nil
  end

  it 'is generated as Bignum' do
      expect(Rbflake.new.generate.class).to eq(Bignum)
  end

  it 'is 32 Byte' do
      expect(Rbflake.new.generate.to_s.bytesize).to eq(32)
  end

end
