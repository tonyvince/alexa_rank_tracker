module Alexa
  require 'net/http'
  require 'rexml/document'
  require 'date'
  
  def get_alexa_rank
    alexaValue = nil
    xml_data = Net::HTTP.get_response(URI.parse('http://data.alexa.com/data?cli=10&data=snbamz&url='+@url)).body
    doc = REXML::Document.new(xml_data)
    doc.elements.each('ALEXA/SD/POPULARITY') do |ele|
    	alexaValue =  ele.attributes["TEXT"].to_s
    	break
    end
    alexaValue
  end
end
