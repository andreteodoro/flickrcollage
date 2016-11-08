require 'spec_helper'

describe FlickrService::Dictionary do

  describe 'read' do
    it 'should read a random keyword from dict' do
      expect(FlickrService::Dictionary.read).to_not be_nil
      expect(FlickrService::Dictionary.read).to_not be_empty
      expect(FlickrService::Dictionary.read).to be_instance_of(String)
    end
  end
end