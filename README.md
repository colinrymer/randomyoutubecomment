# RandomYouTubeComment #

## What it does ##
Gets you a pseudo-random comment from a psuedo-random YouTube Video.

## Installation ##
Installation requires Ruby >= 1.9.2-p290* and the Bundler gem.

* This may work on earlier Ruby versions, but it has only been tested on Ruby 1.9.2-p290 and Ruby 1.9.3-p194.

To install:

  1. Clone the repository.
  2. Set your Wordnik API key (Rename `config/app_config.yml.example` to `config/app_config.yml` and update the Wordnik API key or set the `WORDNIK_KEY` env variable depending on deployment.)
  3. Install the necessary gems: `bundle install`

## Usage ##
`ruby web.rb`

## Setting it up on Heroku ##

If the Heroku gem hasn't been installed, install it: `gem install heroku`.

Make sure you are in the root directory of the application and that there is an initialized git repository (if you cloned this repository, this will already be the case).

Then:

  1. `heroku create --stack cedar`
  2. `heroku config:add WORDNIK_KEY='your_wordnik_api_key'
  3. `git add .`
  4. `git commit -m 'preparing for heroku deployment'`
  5. `git push heroku master`
  6. boom. navigate to the url provided by heroku and enjoy.

## Is it any good? ##
I suppose.

## License ##

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>