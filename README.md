# Flickrcollage

* accepts a list of search keywords as arguments
* queries the Flickr API for the top-rated image for each keyword
* downloads the results
* crops them rectangularly
* assembles a collage grid from twelve images and
* writes the result to a user-supplied filename

If given less than twelve keywords, or if any keyword fails to
result in a match, retrieve random words from a dictionary
source such as `/usr/share/dict/words`. Repeat as necessary
until you have gathered ten images.


## Requirements

Install [ImageMagick](http://www.imagemagick.org/). On OS X it can be done with Homebrew `brew install imagemagick`.

The application is using my keys to access the Flickr Api, if you want to generate and use your own follow these steps:
Obtain Flickr API key from https://www.flickr.com/services/apps/create/apply
Export them as environment variables
```bash
export FLICKR_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx # Replace with your key
export FLICKR_API_SECRET=xxxxxxxxxxxxxxxx # Replace with your secret
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flickrcollage'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flickrcollage

## Usage

   Type for help:
   & flickrcollage -h
    
    
   & flickrcollage --keywords='etventure germany hamburg amazing country' --filename='result.jpg'


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

