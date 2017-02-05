class AlexaRanksController < ApplicationController
  include Alexa
  def get_rank
    @url = params[:alexa_rank][:given_url]
    @rank =  get_alexa_rank
    respond_to do |format|
      if !@rank.nil?
        format.html { redirect_to root_path, notice: 'Got alexa rank successfully' }
        format.js
        format.json { render json: { 'rank': @rank} }
      else
        format.html { redirect_to root_path, notice: "No rank found for #{@url}" }
        format.json { render json: {'status': 'unprocessable_entity'} }
      end
    end
  end
end
