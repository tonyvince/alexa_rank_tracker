module Recurring
  class MyTask
    include Delayed::RecurringJob
    run_every 1.day
    run_at '12:00pm'
    timezone 'UTC'
    def perform
      url = "http://alexa.com/siteinfo/example.com"
      doc = Nokogiri::HTML(open(url))
      @rank = doc.at_css("strong.metrics-data.align-vmiddle").text
      DailyRank.create(rank: @rank) 
    end
  end
end