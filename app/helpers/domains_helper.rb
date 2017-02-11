module DomainsHelper
  
  def get_categories
    Rank.select(:date).distinct.order(date: :desc).limit(10).reverse.map{|rank| rank.date.strftime("%Y-%m-%d")}
  end
  
end
