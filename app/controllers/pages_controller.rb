class PagesController < ApplicationController
  def index
    @rank = DailyRank.last.try(:rank)
    @rank_history = DailyRank.order(:created_at).limit(10)
  end
end