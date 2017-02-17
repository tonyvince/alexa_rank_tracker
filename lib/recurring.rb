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
      domains = Domain.includes(:ranks)
      domains.each do |domain|
        url = domain.try(:name)
        if domain.ranks.last.date != Date.today
          doc = Nokogiri::HTML(open(base_url + url))
          new_rank = doc.at_css("strong.metrics-data.align-vmiddle").text.gsub(/\s+/,'')
          @rank = Rank.new(rank: new_rank, date: Date.today, domain_id: domain.id)
          @rank.save
        end
      end
    end
  end
end