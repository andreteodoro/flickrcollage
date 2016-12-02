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

Install [RMagick](https://github.com/rmagick/rmagick). On OS X it can be done with Homebrew `brew install rmagick`.

The application is using my keys to access the Flickr Api, if you want to generate and use your own follow these steps:
Obtain Flickr API key from https://www.flickr.com/services/apps/create/apply
Export them as environment variables
```bash
    export FLICKR_API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx # Replace with your key
    export FLICKR_API_SECRET=xxxxxxxxxxxxxxxx # Replace with your secret
```
Or modify this file /config/credentials.yml
```ruby
    api_key: yourapikeyhere
    shared_secret: yoursecretkeyhere
```

## Installation

Add this line to your application's Gemfile:

```bash
    gem 'flickrcollage'
```

And then execute:

```bash
    $ bundle
```

Or install it yourself as:

```bash
    $ gem install flickrcollage
```

## Usage

```bash
   $ flickrcollage -k house cars bus dog star germany netherlands amazing countries -f result.jpg
```
   
   If you need help:
   
```bash      
   $ flickrcollage -h
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

