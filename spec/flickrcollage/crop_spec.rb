require 'spec_helper'

describe FlickrService::Crop do

  let(:flickr_api) { FlickrService::FlickrApi.new }
  let(:crop) { FlickrService::Crop }
  let(:keywords) { ['Hamburg','Germany'] }

  describe ".crop" do

    it "have the size: width 640 height 480" do
      urls = keywords.map do |keyword|
        flickr_api.query_by_keyword(keyword)
      end

      cropped_imgs = crop.crop_all(urls)

      cropped_imgs.each do |img|
        expect(img.columns).to eq 640
        expect(img.rows).to eq 480
      end
    end
  end

end