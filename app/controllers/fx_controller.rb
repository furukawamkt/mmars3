class FxController < ApplicationController

  def calc
    
    @fare = Fare.where(ent: params[:ent]).where(ext: params[:ext]).first
    
    respond_to do |format|
      format.html { render :calc }
      format.json { render json: @fare }
    end
  
  end

end
