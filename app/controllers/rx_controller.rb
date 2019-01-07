class RxController < ApplicationController
  
  def regist
    
    @reserve = Reserve.create(name: params[:name], date: params[:date], \
                              ent: params[:ent], ext: params[:ext], amount: params[:amount])
    
    respond_to do |format|
      format.html { render :regist }
      format.json { render json: @reserve }
    end
    
  end
  
end
