require 'spec_helper'

describe FlickrService::Collage do

  let(:collage_service) { FlickrService::Collage }
  let(:img_list) { Magick::ImageList.new }

  before do
    for i in 0..9
      img = Magick::Image.new(200,200)
      img_list << img
    end
  end

  describe "Test the images collage grid feature" do
    let(:collage) { collage_service.mount(img_list) }

    it "return a collage grid with the width of 5 images" do
      expect(collage.columns).to eq 1010
    end

    it "save the collage img in disk" do
      collage_service.write(collage, 'image.jpg')
      expect(File.exist?('image.jpg')).to be true
      FileUtils.rm 'image.jpg'
    end

    it "save the collage img without extension in disk" do
      collage_service.write(collage, 'image')
      expect(File.exist?('image.jpg')).to be true
      FileUtils.rm 'image.jpg'
    end

  end


end