require 'spec_helper'
require 'flickrcollage'

describe FlickrCollage do
  let(:keywords) { ['Game of Thrones', 'Lost', 'Dexter'] }
  let(:filename) { 'Output.jpg' }

  it "initialize flickrcollage" do
    expect(FlickrCollage::App.begin(keywords, filename)).to be true
    #FileUtils.rm 'Output.jpg'
  end

end