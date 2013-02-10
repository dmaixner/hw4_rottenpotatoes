class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end

  def self.find_movies_by_director(id)
    m = Movie.find id
    Movie.find_all_by_director(m.director)
  end
end
