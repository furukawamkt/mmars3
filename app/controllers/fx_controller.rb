class FxController < ApplicationController
  def index
    @fares = Fare.all
  end

  def show
    @fare = Fare.where(ent: params[:ent]).where(ext: params[:ext]).first
    
    respond_to do |format|
      format.json { render json: @fare }
    end
  
  end

  def new
    @fare = Fare.new
  end

  def create
    @fare = Fare.new(fare_params)

    respond_to do |format|
      if @fare.save
        format.html { redirect_to @fare, notice: 'Fare was successfully created.' }
        format.json { render :show, status: :created, location: @fare }
      else
        format.html { render :new }
        format.json { render json: @fare.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    
    respond_to do |format|
      if @fare.update(fare_params)
        format.html { redirect_to @fare, notice: 'Fare was successfully updated.' }
        format.json { render :show, status: :ok, location: @fare }
      else
        format.html { render :edit }
        format.json { render json: @fare.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    @fare.destroy
    respond_to do |format|
      format.html { redirect_to fares_url, notice: 'Fare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
end
