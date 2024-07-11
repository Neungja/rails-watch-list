class WelcomeController < ApplicationController
  def index
    @lists = List.all
    @movies = Movie.all
    tmdb_api = TheMovieDatabaseApi.new
    @data_json = tmdb_api.top_rated
    @god_father = tmdb_api.by_movie_id(238)

  end
end
