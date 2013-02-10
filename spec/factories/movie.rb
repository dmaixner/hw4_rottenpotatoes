FactoryGirl.define do
  factory :movie do
    title 'Movie Title'
    rating 'PG'
    description 'description of movie'
    release_date {10.years.ago}
    created_at {1.year.ago}
    updated_at {1.year.ago}
    director 'director A'
  end
end
