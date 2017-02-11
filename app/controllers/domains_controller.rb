class DomainsController < ApplicationController
  include Alexa
  
  def index
    @rank = DailyRank.last.try(:rank)
    @rank_history = DailyRank.where(user_id: current_user.try(:id)).order(:date)
    @domain = current_user.domains.build
    x_axis_data, y_axis_data = DailyRank.get_graph_data(@rank_history)
    @chart = DailyRank.get_graph(x_axis_data, y_axis_data)
    @chart_globals = DailyRank.get_global_graph
  end
  
  def new
    @domain = Domain.new
  end
  
  def create
    @url = params[:domain][:name]
    @domain_rank =  get_alexa_rank
    @domain = current_user.domains.build(domain_params)
    @rank = @domain.ranks.build(rank: @domain_rank, date: today)
    respond_to do |format|
      if @domain.save
        @rank.save
        format.html { redirect_to user_domain_path(user_id: @domain.user_id, id: @domain.id), notice: "Saved" }
        format.json { render :show, status: :created, location: @domain }
      else
        format.html { render :index }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @domains = current_user.domains
  end
  
  private
    
    def domain_params
      params.require(:domain).permit(:name, :user_id)
    end
end