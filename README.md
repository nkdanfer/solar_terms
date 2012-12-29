# SolarTerms

Chinese solar terms, extension Date Class, Time Class and DateTime Class.

"小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至"


## Installation

Add this line to your application's Gemfile:

    gem 'solar_terms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install solar_terms

## Usage

Time.now.solar_term
Time.now.solar_term_name
Time.now.solar_term_time

Date.today.solar_term
Date.today.solar_term_name
Date.today.solar_term_time

Time.new(2012,11,22,5,50,07,"+08:00").solar_term \# return 21
Time.new(2012,11,22,5,50,07,"+08:00").solar_term_name \# return 小雪

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
