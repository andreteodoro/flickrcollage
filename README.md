# Flickrcollage

Your mission, should you choose to accept it
============================================

Write a Ruby command line application that

* accepts a list of search keywords as arguments
* queries the Flickr API for the top-rated image for each keyword
* downloads the results
* crops them rectangularly
* assembles a collage grid from ten images and
* writes the result to a user-supplied filename
* host your code repository on github or bitbucket

If given less than ten keywords, or if any keyword fails to
result in a match, retrieve random words from a dictionary
source such as `/usr/share/dict/words`. Repeat as necessary
until you have gathered ten images.

Be careful and conservative in your handling of files and
other IO. Bonus points for wrapping the application in a
Gem. Please include a README with instructions on how to
install and run your application.

Hint: You're free to use any existing Gem which helps you to
get the challenge done.

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

flickrcollage --keywords='etventure germany hamburg amazing country' --filename='result.jpg'

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/flickrcollage. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

