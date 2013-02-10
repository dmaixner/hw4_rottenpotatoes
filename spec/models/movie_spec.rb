require 'spec_helper'

describe Movie do
  describe 'find movies by director' do
    it "should find movies with director A" do
      m1=FactoryGirl.create(:movie,:title=>"Movie Title 1")
      m2=FactoryGirl.create(:movie,:title=>"Movie Title 2")
      m3=FactoryGirl.create(:movie,:title=>"Movie Title 3",:director=>"director B")
      m4=FactoryGirl.create(:movie,:title=>"Movie Title 4",:director=>"director C")
      movies = Movie.find_movies_by_director(m1.director)
      movies.size.should == 2
    end
  end
end
