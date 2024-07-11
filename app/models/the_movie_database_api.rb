require 'net/http'
require 'json'
require 'uri'

# url = URI("https://api.themoviedb.org/3/movie/movie_id?language=en-US")


class TheMovieDatabaseApi
  attr_reader :base_url

  def initialize
    @base_url = URI("https://tmdb.lewagon.com")
  end

  def top_rated
    get_request("/movie/top_rated")
  end

  def by_movie_id(movie_id)
    get_request("/movie/#{movie_id}")
  end

  def by_movie_name(name)
    sanitized_name = sanitize_name(name)
    puts sanitized_name
    get_request("/search/movie?query=#{sanitized_name}")
  end

  def by_tv_id(tv_id)
    get_request("/tv/#{tv_id}")
  end

  private

  def get_request(endpoint)
    uri = URI.join(@base_url, endpoint)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    puts uri
    request = Net::HTTP::Get.new(uri)
    request["accept"] = 'application/json'

    response = http.request(request)
    JSON.parse(response.read_body)
  rescue JSON::ParserError => e
    { error: "Failed to parse JSON response: #{e.message}" }
  rescue => e
    { error: "An error occurred: #{e.message}" }
  end

  def sanitize_name(name)
    # Convert to lowercase
    name = name.downcase
    # Replace spaces with plus signs
    name = name.gsub(/\s+/, '+')
    # Encode special characters
    name = CGI.escape(name)
    # Remove any remaining unsafe characters
    name = name.gsub(/[^a-z0-9\-_\+]/i, '')
    name
  end

end
