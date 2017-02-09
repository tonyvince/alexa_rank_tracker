module Alexa

  require 'nokogiri'
  require 'open-uri'
  
  def get_alexa_rank
    alexaValue = nil
    url = "http://alexa.com/siteinfo/" + @url
    doc = Nokogiri::HTML(open(url))
    alexaValue = doc.at_css("strong.metrics-data.align-vmiddle").text.gsub(/\s+/,'')
  end
end
