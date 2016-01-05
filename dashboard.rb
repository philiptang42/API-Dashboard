require "./lib/geolocation"
require "sinatra/base"

require "dotenv"
Dotenv.load

class Dashboard < Sinatra::Base
  get("/") do
    @ip = request.ip
    @geolocation = Geolocation.new(@ip)

    @weather = Weather.new(@geolocation.zip)
    erb :dashboard
  end
end
