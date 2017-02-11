module DomainsHelper
  
  def get_categories
    (10.days.ago.to_date..Date.today).map { |date| date.strftime("%Y-%m-%d")}
  end
  
end
