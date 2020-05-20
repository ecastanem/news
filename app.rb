require "sinatra"
require "sinatra/reloader"
require "httparty"
require "date"
def view(template); erb template.to_sym; end

get "/" do

  ### Get the News
  key_news="402fd1c626e746389b2ab873ac779d99"
  country="mx"
  url_news="https://newsapi.org/v2/top-headlines?country=#{country}&apiKey=#{key_news}"

  
  ### Get the weather
  lat = 19.432608
  long = -99.133209
  units = "metric" 
  key = "4a811250b2102d0aedd860a30da075e2" 
  url = "https://api.openweathermap.org/data/2.5/onecall?lat=#{lat}&lon=#{long}&units=#{units}&appid=#{key}"

  # make the call
  @top_news = HTTParty.get(url_news).parsed_response.to_hash
  @top_news_titles = @top_news["articles"]

  @weather = HTTParty.get(url).parsed_response.to_hash
  @current = @weather["current"]["temp"]
  @current_fl = @weather["current"]["feels_like"]
  @forecast = @weather["daily"]



  ### Get the news
  view 'news'
end
