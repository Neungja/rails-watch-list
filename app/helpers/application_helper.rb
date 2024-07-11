module ApplicationHelper

  def tmdb_img(file_path)
    return "https://image.tmdb.org/t/p/original/#{file_path}"
  end
end
