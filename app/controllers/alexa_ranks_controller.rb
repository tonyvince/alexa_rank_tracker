class AlexaRanksController < ApplicationController
  include Alexa
  def get_rank
    @url = params[:alexa_rank][:given_url]
    @rank =  get_alexa_rank
    @daily_rank = DailyRank.new(rank: @rank, domain: @url, user_id: current_user.id, date: today)
    @domain = current_user.domains.create(name: @url)
    @domain.ranks.create(rank: @rank, date: today)
    respond_to do |format|
      if !@rank.nil? && @rank != "-"
        if @daily_rank.save
          format.html { redirect_to root_path, notice: 'Got alexa rank successfully' }
          format.js
          format.json { render json: { 'rank': @rank} }
        else
          format.html { redirect_to root_path, alert: 'Oops! Something went wrong' }
          format.js
          format.json { render json: { 'status': 'unprocessable_entity'} }
        end
      else
        format.html { redirect_to root_path, notice: "No rank found for #{@url}" }
        format.json { render json: {'status': 'unprocessable_entity'} }
      end
    end
  end
  
  private 
    
    def today
      Date.today.strftime("%Y-%m-%d")
    end
end
