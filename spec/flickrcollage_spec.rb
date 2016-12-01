require 'spec_helper'
require 'flickrcollage'

describe FlickrCollage do
  let(:keywords) { ['Game of Thrones', 'Lost', 'Dexter', 'Sons of Anarchy', 'Prison Break', 'Fringe', 'Hannibal'] }
  let(:filename) { 'Output.jpg' }

  it ".flickrcollage" do
    expect(FlickrCollage::App.begin(keywords, filename)).to be true
    #FileUtils.rm 'Output.jpg'
  end

end