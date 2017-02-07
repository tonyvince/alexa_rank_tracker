class PagesController < ApplicationController
  def index
    @rank = DailyRank.last.try(:rank)
    @rank_history = DailyRank.order(:created_at).limit(10)
    x_axis_data, y_axis_data = DailyRank.get_graph_data(@rank_history)
    @chart = DailyRank.get_graph(x_axis_data, y_axis_data)
    @chart_globals = DailyRank.get_global_graph
  end
end