class DailyRank < ActiveRecord::Base
  def self.get_graph_data(daily_ranks)
    dates = []
    ranks = []
    daily_ranks.each do |rank|
      dates.push(rank.created_at.strftime("%Y-%m-%d"))
      ranks.push(rank.rank.gsub(/,/, '').to_i)
    end
    return dates, ranks
  end
  
  def self.get_graph(x_axis_data, y_axis_data)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Alexa rank of <i>example.com</i> for last 10 days")

      f.series(name: "Alexa Rank", data: y_axis_data, type: 'line')
    
      f.yAxis [
        {title: {text: "Rank in thousands", margin: 30} },
      ]
      
      f.xAxis [
        {title: {text: "Date", margin: 10}, categories: x_axis_data}
      ]
    
      f.legend(align: 'right', verticalAlign: 'top', y: 75, x: -50, layout: 'vertical')
      f.chart({defaultSeriesType: "column"})
    end
  end
  
  def self.get_global_graph
    LazyHighCharts::HighChartGlobals.new do |f|
      f.global(useUTC: false)
      f.chart(
        backgroundColor: {
          linearGradient: [0, 0, 500, 500],
          stops: [
            [0, "rgb(255, 255, 255)"],
            [1, "rgb(240, 240, 255)"]
          ]
        },
        borderWidth: 2,
        plotBackgroundColor: "rgba(255, 255, 255, .9)",
        plotShadow: true,
        plotBorderWidth: 1
      )
      f.lang(thousandsSep: ",")
      f.colors(["#90ed7d", "#f7a35c", "#8085e9", "#f15c80", "#e4d354"])
    end
  end
end
