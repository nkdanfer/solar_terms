# encoding: utf-8
require File.expand_path('../solar_terms/version', __FILE__)
require 'date'
module SolarTerms
  # Timezone: +08:00
  TERM_NAMES = ["小寒","大寒","立春","雨水","惊蛰","春分","清明","谷雨","立夏","小满","芒种","夏至","小暑","大暑","立秋","处暑","白露","秋分","寒露","霜降","立冬","小雪","大雪","冬至"]

  TERMS_TABLE = [
    "2012-01-06 06:43:54","2012-01-21 00:09:49","2012-02-04 18:22:23","2012-02-19 14:17:35","2012-03-05 12:21:02","2012-03-20 13:14:25",
    "2012-04-04 17:05:36","2012-04-20 00:12:04","2012-05-05 10:19:40","2012-05-20 23:15:31","2012-06-05 14:25:53","2012-06-21 07:08:48",
    "2012-07-07 00:40:43","2012-07-22 18:00:51","2012-08-07 10:30:32","2012-08-23 01:06:50","2012-09-07 13:29:00","2012-09-22 22:48:59",
    "2012-10-08 05:11:42","2012-10-23 08:13:33","2012-11-07 08:25:56","2012-11-22 05:50:07","2012-12-07 01:18:55","2012-12-21 19:11:35",

    "2013-01-05 12:33:37","2013-01-20 05:51:42","2013-02-04 00:13:25","2013-02-18 20:01:35","2013-03-05 18:14:51","2013-03-20 19:01:55",
    "2013-04-04 23:02:27","2013-04-20 06:03:18","2013-05-05 16:18:09","2013-05-21 05:09:30","2013-06-05 20:23:19","2013-06-21 13:03:56",
    "2013-07-07 06:34:36","2013-07-22 23:55:58","2013-08-07 16:20:21","2013-08-23 07:01:41","2013-09-07 19:16:16","2013-09-23 04:44:08",
    "2013-10-08 10:58:29","2013-10-23 14:09:48","2013-11-07 14:13:52","2013-11-22 11:48:06","2013-12-07 07:08:31","2013-12-22 01:10:59",

    "2014-01-05 18:24:10","2014-01-20 11:51:14","2014-02-04 06:03:15","2014-02-19 01:59:29","2014-03-06 00:02:15","2014-03-21 00:57:06",
    "2014-04-05 04:46:39","2014-04-20 11:55:32","2014-05-05 21:59:25","2014-05-21 10:59:02","2014-06-06 02:03:02","2014-06-21 18:51:13",
    "2014-07-07 12:14:45","2014-07-23 05:41:21","2014-08-07 22:02:28","2014-08-23 12:45:58","2014-09-08 01:01:25","2014-09-23 10:29:04",
    "2014-10-08 16:47:29","2014-10-23 19:57:03","2014-11-07 20:06:40","2014-11-22 17:38:11","2014-12-07 13:04:05","2014-12-22 07:03:01",

    "2015-01-06 00:20:32","2015-01-20 17:43:14","2015-02-04 11:58:27","2015-02-19 07:49:47","2015-03-06 05:55:39","2015-03-21 06:45:07",
    "2015-04-05 10:39:07","2015-04-20 17:41:50","2015-05-06 03:52:35","2015-05-21 16:44:45","2015-06-06 07:58:09","2015-06-22 00:37:53",
    "2015-07-07 18:12:14","2015-07-23 11:30:25","2015-08-08 04:01:23","2015-08-23 18:37:15","2015-09-08 06:59:33","2015-09-23 16:20:31",
    "2015-10-08 22:42:47","2015-10-24 01:46:41","2015-11-08 01:58:36","2015-11-22 23:25:15","2015-12-07 18:53:19","2015-12-22 12:47:55",

    "2016-01-06 06:08:21","2016-01-20 23:27:04","2016-02-04 17:46:00","2016-02-19 13:33:41","2016-03-05 11:43:30","2016-03-20 12:30:08",
    "2016-04-04 16:27:29","2016-04-19 23:29:23","2016-05-05 09:41:50","2016-05-20 22:36:26","2016-06-05 13:48:28","2016-06-21 06:34:09",
    "2016-07-07 00:03:18","2016-07-22 17:30:10","2016-08-07 09:52:58","2016-08-23 00:38:26","2016-09-07 12:51:02","2016-09-22 22:21:05",
    "2016-10-08 04:33:20","2016-10-23 07:45:30","2016-11-07 07:47:38","2016-11-22 05:22:20","2016-12-07 00:41:05","2016-12-21 18:44:07",

    "2017-01-05 11:55:42","2017-01-20 05:23:33","2017-02-03 23:34:01","2017-02-18 19:31:16","2017-03-05 17:32:40","2017-03-20 18:28:35",
    "2017-04-04 22:17:16","2017-04-20 05:26:58","2017-05-05 15:30:59","2017-05-21 04:30:53","2017-06-05 19:36:33","2017-06-21 12:24:06",
    "2017-07-07 05:50:38","2017-07-22 23:15:18","2017-08-07 15:39:58","2017-08-23 06:20:09","2017-09-07 18:38:34","2017-09-23 04:01:44",
    "2017-10-08 10:22:05","2017-10-23 13:26:36","2017-11-07 13:37:45","2017-11-22 11:04:34","2017-12-07 06:32:35","2017-12-22 00:27:53",

    "2018-01-05 17:48:41","2018-01-20 11:08:58","2018-02-04 05:28:25","2018-02-19 01:17:57","2018-03-05 23:28:06","2018-03-21 00:15:24",
    "2018-04-05 04:12:43","2018-04-20 11:12:29","2018-05-05 21:25:18","2018-05-21 10:14:33","2018-06-06 01:29:04","2018-06-21 18:07:12",
    "2018-07-07 11:41:47","2018-07-23 05:00:16","2018-08-07 21:30:34","2018-08-23 12:08:30","2018-09-08 00:29:37","2018-09-23 09:54:01",
    "2018-10-08 16:14:37","2018-10-23 19:22:18","2018-11-07 19:31:39","2018-11-22 17:01:24","2018-12-07 12:25:48","2018-12-22 06:22:38",

    "2019-01-05 23:38:52","2019-01-20 16:59:27","2019-02-04 11:14:14","2019-02-19 07:03:51","2019-03-06 05:09:39","2019-03-21 05:58:20",
    "2019-04-05 09:51:21","2019-04-20 16:55:10","2019-05-06 03:02:40","2019-05-21 15:59:01","2019-06-06 07:06:18","2019-06-21 23:54:09",
    "2019-07-07 17:20:25","2019-07-23 10:50:16","2019-08-08 03:12:57","2019-08-23 18:01:53","2019-09-08 06:16:46","2019-09-23 15:50:02",
    "2019-10-08 22:05:32","2019-10-24 01:19:37","2019-11-08 01:24:15","2019-11-22 22:58:48","2019-12-07 18:18:21","2019-12-22 12:19:18",

    "2020-01-06 05:29:59","2020-01-20 22:54:33","2020-02-04 17:03:12","2020-02-19 12:56:53","2020-03-05 10:56:44","2020-03-20 11:49:29",
    "2020-04-04 15:38:02","2020-04-19 22:45:21","2020-05-05 08:51:16","2020-05-20 21:49:09","2020-06-05 12:58:18","2020-06-21 05:43:33",
    "2020-07-06 23:14:20","2020-07-22 16:36:44","2020-08-07 09:06:03","2020-08-22 23:44:48","2020-09-07 12:07:54","2020-09-22 21:30:32",
    "2020-10-08 03:55:07","2020-10-23 06:59:25","2020-11-07 07:13:46","2020-11-22 04:39:38","2020-12-07 00:09:21","2020-12-21 19:11:35",
    "2021-01-05 12:33:37"
  ]

  def solar_term
    index_of_all_terms % 24
  end

  def solar_term_name
    TERM_NAMES[solar_term]
  end

  def solar_term_time
    solar_term_times[index_of_all_terms]
  end

  def solar_term_seconds
    self.to_time.utc.to_i - solar_term_time.to_i
  end

  def solar_term_minutes
    solar_term_seconds / 60.0
  end

  def solar_term_hours
    solar_term_seconds / 3600.0
  end

  def solar_term_days
    solar_term_seconds / 86400.0
  end

  private
  def index_of_all_terms
    t = self.to_time
    v = solar_term_times.select{|time| time >= t.utc }.first
    v == t.utc ? solar_term_times.index(v) : solar_term_times.index(v) - 1
  end

  def solar_term_times
    @solar_term_times ||= TERMS_TABLE.collect{|s| args = s.split(/[^\d]+/).collect{|n| n.to_i }.push "+08:00"; Time.new(*args).utc }
  end
end

Date.class_eval { include ::SolarTerms }
Time.class_eval { include ::SolarTerms }
DateTime.class_eval { include ::SolarTerms }