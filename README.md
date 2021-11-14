# LogReader

Log reader is a simple script that reads a file with.log extension and perform parsing to get the unique records data about

## Installation

- Navigate to directory
- run bundle install

rake run FILE="/Users/usman/www/sites/tests/smart-pension/log_reader/spec/tmp/webserver.log"
(added this command and environment variable so that its more readable)

## Usage

> Returns the list of webpages with ##most page views
> Return the list of webpages with ##most unique page

## Development

I initialized a ruby gem and integrated rubocop to lint the files and added rake gem to execute ruby code in a readable way.I removed unnecessary file.
Added bundler instead of gemspec.
Added rspec for testing the application
Approch:

- I have added 3 libs, parser, reader and display
  Parser is basically the class which orchestrate reader and disply classes.
  In reader I have implemented logic to read file, and map it in a way that I get following structure
  {
  "path": {
  count: 2,
  uniq_visits: 2,
  ips: {
  'ip1': 1,
  'ip2': 1,
  }
  }
  }
  I kept Ips so that we can display any further information at later stages
  The purpose of doing the mapping inside reader was that we can avoid extra itterations.
  that the parser class uses it and sort data and displays it on the console

## Things I could have better

- I could have added more specs
- I coud have handled exceptions better in specs i.e handled specific exceptions instead of generic raise checks
- I could have added a make file so that everything is set up automatically
