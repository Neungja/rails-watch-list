class ListsController < ApplicationController
  def index
    @lists = List.all
    tmdb_api = TheMovieDatabaseApi.new
    @data_json = tmdb_api.top_rated
    @god_father = tmdb_api.by_movie_id(238)

    @sister_act = tmdb_api.by_movie_id(2005)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
