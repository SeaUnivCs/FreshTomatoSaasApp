json.array!(@movies) do |movie|
  json.extract! movie, :id, :title, :rating, :description, :release_date
  json.url movie_url(movie, format: :json)
end
