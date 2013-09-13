# SolarTerms

Chinese solar terms, extension Date Class, Time Class and DateTime Class.

"小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至"

Date range from 2012-01-06 to 2030-11-22.

## Installation

Add this line to your application's Gemfile:

    gem 'solar_terms'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install solar_terms

## Usage
```ruby
  Time.now.solar_term #get the index number of current solar term, between 0 and 23

  Time.now.solar_term_name #get current solar term name in chinese words

  Time.now.solar_term_time #get current solar term begin time in

  Time.now.solar_term_seconds #get seconds form current solar term beginning

  Time.now.solar_term_minutes #get minutes form current solar term beginning

  Time.now.solar_term_hours #get hours form current solar term beginning

  Time.now.solar_term_days #get days form current solar term beginning

  Date.today.solar_term 

  Date.today.solar_term_name

  Date.today.solar_term_time

  Time.new(2012,11,22,5,50,07,"+08:00").solar_term \# return 21

  Time.new(2012,11,22,5,50,07,"+08:00").solar_term_name \# return 小雪

```

## Refrerence

[莆田十中 许剑伟 小鬼1.1][ref]

[ref]: http://www.fjptsz.com/xxjs/xjw/rj/113.htm