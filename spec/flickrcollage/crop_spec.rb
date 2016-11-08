require 'spec_helper'

describe FlickrService::Crop do

  let(:flickr_api) { FlickrService::FlickrApi.new }
  let(:crop) { FlickrService::Crop }
  let(:keywords) { ['Hamburg','Germany'] }

  describe "Test the images returned from Crop" do

    it "have the size: width 200 height 200" do
      urls = keywords.map do |keyword|
        flickr_api.query_by_keyword(keyword)
      end

      cropped_imgs = crop.crop_all(urls)

      cropped_imgs.each do |img|
        expect(img.columns).to eq 200
        expect(img.rows).to eq 200
      end
    end
  end

end