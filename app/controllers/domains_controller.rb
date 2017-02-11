class DomainsController < ApplicationController
  include Alexa
  
  def index
    @domain = current_user.domains.build
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
      if @domain_rank != nil && @domain_rank != "-"
        if @domain.save
          @rank.save
          format.html { redirect_to user_domain_path(user_id: @domain.user_id, id: @domain.id), notice: "Domain saved successfully" }
          format.json { render :show, status: :created, location: @domain }
        else
          format.html { render :index }
          format.json { render json: @domain.errors, status: :unprocessable_entity }
        end        
      else
        format.html { redirect_to root_path, notice: "No rank found for #{@url}" }
        format.json { render json: {'status': 'unprocessable_entity'} }
      end
    end
  end
  
  def show
    @domain_data = User.includes(domains: [:ranks]).find(current_user.id)
    @my_hash = {
        name: 'Tokyo',
        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
        }
  end
  
  private
    
    def domain_params
      params.require(:domain).permit(:name, :user_id)
    end
end