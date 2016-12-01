require 'spec_helper'

describe Dictionary do

  describe '.dictionary' do
    it 'read a random keyword from dict' do
      expect(Dictionary.read).to_not be_nil
      expect(Dictionary.read).to_not be_empty
      expect(Dictionary.read).to be_instance_of(String)
    end
  end
end