require 'net/http'
require 'net/https'
require 'uri'
require 'json'

class FaresController < ApplicationController
  before_action :set_fare, only: [:show, :edit, :update, :destroy]
  
  def get_event(keyword)
  
    params = URI.encode_www_form({keyword: keyword})
    uri = URI.parse("https://eventon.jp/api/events.json?#{params}")
    @query = uri.query

    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = https.get(uri.request_uri)
    
    begin
      case response
      # 成功した場合
      when Net::HTTPSuccess
        @result = JSON.parse(response.body)
        @title = @result["events"][0]["title"]
        @place = @result["events"][0]["place"]
        @date = @result["events"][0]["started_at"]
      # 別のURLに飛ばされた場合
      when Net::HTTPRedirection
        @message = "redirection"
      # その他エラー
      else
        @message = "error"
      end
    # エラー時処理
    rescue IOError => e
      @message = e.message
    rescue TimeoutError => e
      @message = e.message
    rescue JSON::ParserError => e
      @message = e.message
    rescue => e
      @message = e.message
    end
    
  end
  
  # def get_weather(keyword)
  
  #   params = URI.encode_www_form({q: "osaka"})
  #   uri = URI.parse("https://api.openweathermap.org/data/2.5/forecast?#{params}&units=metric&APPID=5307733b873da60f436160c4203d9fd7")
  #   @query = uri.query

  #   https = Net::HTTP.new(uri.host,uri.port)
  #   https.use_ssl = true
  #   https.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #   response = https.get(uri.request_uri)
    
  #   begin
  #     case response
  #     # 成功した場合
  #     when Net::HTTPSuccess
  #       @result = JSON.parse(response.body)
  #       @weather = @result["list"][0]["weather"][0]["main"]
  #     # 別のURLに飛ばされた場合
  #     when Net::HTTPRedirection
  #       @wether = "redirection"
  #     # その他エラー
  #     else
  #       @weather = "error"
  #     end
  #   # エラー時処理
  #   rescue IOError => e
  #     @message = e.message
  #   rescue TimeoutError => e
  #     @message = e.message
  #   rescue JSON::ParserError => e
  #     @message = e.message
  #   rescue => e
  #     @message = e.message
  #   end
    
  # end

  # GET /fares
  # GET /fares.json
  def index
    @fares = Fare.all
  end

  # GET /fares/1
  # GET /fares/1.json
  def show
    
    get_event(@fare.ent)
    @title_ent = @title
    @date_ent  = @date
    @place_ent = @place
    
    #get_weather(@fare.ent)
    #@weather_ent = @weather
    
    get_event(@fare.ext)
    @title_ext = @title
    @date_ext  = @date
    @place_ext = @place
    
    #get_weather(@fare.ext)
    #@weather_ext = @weather

  end

  # GET /fares/new
  def new
    @fare = Fare.new
  end

  # GET /fares/1/edit
  def edit
  end

  # POST /fares
  # POST /fares.json
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

  # PATCH/PUT /fares/1
  # PATCH/PUT /fares/1.json
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

  # DELETE /fares/1
  # DELETE /fares/1.json
  def destroy
    @fare.destroy
    respond_to do |format|
      format.html { redirect_to fares_url, notice: 'Fare was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fare
      @fare = Fare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fare_params
      params.require(:fare).permit(:ent, :ext, :price)
    end
end

