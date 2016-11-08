require 'spec_helper'

describe FlickrService::Crop do

  let(:flickr_api) { FlickrService::FlickrApi.new }
  let(:crop) { FlickrService::Crop }
  let(:keyword) { 'Hamburg' }

  describe "Test the images returned from Crop" do

    it "have the size: width 200 height 200" do
      url = flickr_api.query_by_keyword(keyword)
      expect(crop.crop(url).columns).to eq 200
      expect(crop.crop(url).rows).to eq 200
    end
  end

end