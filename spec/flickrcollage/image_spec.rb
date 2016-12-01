require 'spec_helper'

describe Image do

  let(:images_processor) { ImagesProcessor.new }
  let(:img_list) { Magick::ImageList.new }

  before do
    for i in 0..9
      img = Magick::Image.new(640,480)
      img_list << img
    end
  end

  describe ".save" do
    let(:collage) { images_processor.collage(img_list) }

    it "save the collage img in disk" do
      Image.save(collage, 'image.jpg')
      expect(File.exist?('image.jpg')).to be true
      FileUtils.rm 'image.jpg'
    end

    it "save the collage img without extension in disk" do
      Image.save(collage, 'image')
      expect(File.exist?('image.jpg')).to be true
      FileUtils.rm 'image.jpg'
    end

  end


end