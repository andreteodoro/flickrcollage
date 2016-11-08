require 'spec_helper'

describe FlickrService::Collage do

  before do
    @magick = Magick::ImageList.new
    for i in 0..9
      img = Magick::Image.new(200,200)
      @magick << img
    end
  end

  describe "Test the images collage grid feature" do
    it "return a collage grid with the width of 5 images" do
      expect(FlickrService::Collage.mount(@magick).columns).to eq 1100
    end
  end

end