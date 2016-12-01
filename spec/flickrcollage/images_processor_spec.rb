require 'spec_helper'

describe ImagesProcessor do

  let(:flickr_api) { FlickrApi.new }
  let(:images_processor) { ImagesProcessor.new }
  let(:img_list) { Magick::ImageList.new }
  let(:keywords) { ['Hamburg','Germany'] }

  before do
    for i in 0..9
      img = Magick::Image.new(640,480)
      img_list << img
    end
  end

  describe ".crop" do
    it "has the size: width 640 height 480" do
      urls = keywords.map do |keyword|
        flickr_api.query_by_keyword(keyword)
      end

      cropped_imgs = images_processor.crop(urls)

      cropped_imgs.each do |img|
        expect(img.columns).to eq 640
        expect(img.rows).to eq 480
      end
    end
  end

  describe ".collage" do
    let(:collage) { images_processor.collage(img_list) }

    it "return a collage grid with the width of 5 images" do
      expect(collage.columns).to eq 2568
    end
  end

end