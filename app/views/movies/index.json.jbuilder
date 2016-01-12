json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :description, :movie_length, :director, :rating, :year
  json.url movie_url(movie, format: :json)
end
