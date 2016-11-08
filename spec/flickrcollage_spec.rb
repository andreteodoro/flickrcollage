require 'spec_helper'
require 'flickrcollage'

describe FlickrCollage do
  let(:keywords) { ['Game of Thrones', 'Lost', 'Dexter'] }
  let(:filename) { 'Output.jpg' }

  it "test pass calling the app" do
    expect(FlickrCollage::App.begin(keywords, filename)).to be true
  end

end