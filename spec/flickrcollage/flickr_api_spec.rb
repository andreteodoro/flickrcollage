require 'spec_helper'

describe FlickrService::FlickrApi do

  let(:flickr_api) { FlickrService::FlickrApi.new }
  let(:keyword) { 'Etventure' }

  UrlRegex = /https?:\/\/[-_a-zA-Z0-9.\/]+/

  describe 'Test the initialization' do
    it 'intitialize correctly' do
      expect(flickr_api).to_not be_nil
    end
  end

  describe 'Query photo by keyword' do
    it 'fail with an empty keyword' do
      expect(flickr_api.query_by_keyword).to be_nil
    end

    it 'return a valid url' do
      url = flickr_api.query_by_keyword(keyword)
      expect(url).to_not be_nil
      expect(url).to match(UrlRegex)
    end
  end
end