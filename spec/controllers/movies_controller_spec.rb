require 'spec_helper'

describe MoviesController do
  describe 'find movies by director' do
    it 'should call the model method that performs the search by director' do
      Movie.should_receive(:find_movies_by_director).with('4')
      Movie.should_receive(:find).with('4')
      get :find_movies_by_director, {:id=>4}
    end
    it 'should select the Show Movie template for rendering' do
      Movie.stub(:find_movies_by_director)
      Movie.stub(:find)
      get :find_movies_by_director, {:id=>3}
      response.should render_template('show')
    end
    it 'should make the search results available to that template' do
      fake_movie = [mock('Movie')]
      fake_movies = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_movies_by_director).and_return(fake_movies)
      Movie.stub(:find).and_return(fake_movie)
      get :find_movies_by_director, {:id=>3}
      assigns(:movie).should == fake_movie
      assigns(:movies).should == fake_movies
    end
  end
end
