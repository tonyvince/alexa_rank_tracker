class PagesController < ApplicationController
  def index
    @rank = DailyRank.last.try(:rank)
    # client = Alexa::Client.new(access_key_id: ENV['AWS_ID'], secret_access_key: ENV['AWS_KEY'])
    # url_info = client.url_info(url: "example.com")
  end
end