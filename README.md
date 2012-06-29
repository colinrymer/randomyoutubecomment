# Sinatra Heroku Boilerplate #


## Installation ##
Installation of the boilerplate requires Ruby and the Bundler gem.

To install:

  1. Clone the repository.
  2. Install the necessary gems: `bundle install`

Using the shotgun gem will allow on-the-fly updating of the application
without requiring a manual restart. The gem can be installed with the
command `gem install shotgun`. `sudo` may be required.

## Usage ##
`ruby web.rb`

If the shotgun gem is installed:
`shotgun -s thin web.rb`

Shotgun will reload the application anytime it detects changes in the
application folder, but since it restarts the application, its usage
should be limited to development.

## Setting it up on Heroku ##

If the Heroku gem hasn't been installed, install it: `gem install heroku`.

Make sure you are in the root directory of the application and that there is an initialized git repository (if you cloned the repo, this will already be the case).

Then:

  1. `heroku create --stack cedar`
  2. `git add .`
  3. `git commit -m 'preparing for heroku deployment'`
  4. `git push heroku master`
  5. boom. navigate to the url provided by heroku and enjoy.

## Is it any good? ##
Yes. Maybe. If you're looking for a full-featured boilerplate, then
bummer. This is pretty bare-bones. I'd love to flesh it out more, but
don't know what I want to add at this point, so you're stuck with what I
hope is a lightweight, easy to use boilerplate. I made this because I'm
too lazy to spend what probably amount to 2.3 minutes creating all this
the old-fashioned way. And I thought I could use the practice.


