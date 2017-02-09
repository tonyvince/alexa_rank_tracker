class DailyRank < ActiveRecord::Base
  belongs_to :user
  validate :user_quota, on: :create
  
  def user_quota
    errors.add(:base, 'OOps!!! You have Exceeded maximum domain limit/user (3)')  if self.user.daily_ranks(:reload).count >= 3
  end
  
  def self.get_graph_data(daily_ranks)
    domains = []
    ranks = []
    daily_ranks.each do |rank|
      domains.push(get_host_without_www rank.domain)
      ranks.push(rank.rank.gsub(/[\s+,]/, '').to_i)
    end
    return domains, ranks
  end
  
  def self.get_host_without_www(url)
    url = "http://#{url}" if URI.parse(url).scheme.nil?
    host = URI.parse(url).host.downcase
    host.start_with?('www.') ? host[4..-1] : host
  end
  
  def self.get_graph(x_axis_data, y_axis_data)
    LazyHighCharts::HighChart.new('graph') do |f|
      f.title(text: "Alexa rank of your websites")

      f.series(name: "Alexa Rank", data: y_axis_data, type: 'line')
      f.yAxis [
        {title: {text: "Website Rank", margin: 30}, reversed: true },
      ]
      
      f.xAxis [
        {title: {text: "Domain", margin: 10}, categories: x_axis_data}
      ]
      f.exporting(width: 800)
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
