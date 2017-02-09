module ApplicationHelper
  def header(text)
    content_for(:header) { text.to_s }
  end
  
  def quota_reached?
    current_user.daily_ranks.count >= 3
  end
end
