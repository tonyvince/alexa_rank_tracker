module Recurring
  class MyTask
    include Delayed::RecurringJob
    run_every 1.day
    run_at '12:02pm'
    timezone 'UTC'
    queue 'slow-jobs'
    def perform
      url = "http://alexa.com/siteinfo/example.com"
      doc = Nokogiri::HTML(open(url))
      File.open("alexa.HTML", 'a+') {|f| f.write(doc) }
      @rank = doc.at_css("strong.metrics-data.align-vmiddle").text
    end
  end
end