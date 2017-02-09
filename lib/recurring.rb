module Recurring
  class MyTask
    require 'nokogiri'
    require 'open-uri'
    include Delayed::RecurringJob
    run_every 1.day
    run_at '12:00pm'
    timezone 'UTC'
    def perform
      base_url = "http://alexa.com/siteinfo/"
      websites = DailyRank.select(:domain).distinct
      websites.each do |website|
        url = website.try(:domain)
        doc = Nokogiri::HTML(open(base_url + url))
        @rank = doc.at_css("strong.metrics-data.align-vmiddle").text.gsub(/\s+/,'')
        DailyRank.where(domain: url).update_all(rank: @rank)
      end
    end
  end
end