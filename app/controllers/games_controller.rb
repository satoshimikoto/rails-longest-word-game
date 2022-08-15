require "open-uri"
require "json"

class GamesController < ApplicationController

  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] }
  end

  def score
    @score = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@score}"
    dog = JSON.parse(URI.open(url).read)
    if dog["found"] == true
      @result = "Congratulations! #{@score} is a valid English word!"
    else
      @result = "Sorry, but #{score} does not seem to be a valid English word..."
    end
  end
end
