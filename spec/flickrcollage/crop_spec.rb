require 'spec_helper'

describe FlickrService::Crop do

  let(:service) { FlickrService::FlickrApi.new }
  let(:keyword) { 'Hamburg' }

  describe "Test the images returned from Crop" do

    it "have the size: width 200 height 200" do
      url = service.query_by_keyword(keyword)
      expect(FlickrService::Crop.crop(url).columns).to eq 200
      expect(FlickrService::Crop.crop(url).rows).to eq 200
    end
  end

end