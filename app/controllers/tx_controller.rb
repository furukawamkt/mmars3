require 'net/http'
require 'uri'
require 'json'

class TxController < ApplicationController
  def index
  end

  def reserve
    
    @name = params[:name]
    @date = params[:date]
    @ent  = params[:ent]
    @ext  = params[:ext]
    
    params = URI.encode_www_form({:ent => "tokyo", :ext => "fukuoka"})
    uri = URI.parse("https://127.0.0.1/fx?#{params}")
    @query = uri.query
    
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    https.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = https.get(uri.request_uri)
    

  end
end
