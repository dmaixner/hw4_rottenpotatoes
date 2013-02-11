require 'spec_helper'

describe MoviesController do
  describe 'find movies by director' do
    it 'should call the model method that performs the search by director' do
      m = mock('Movie')
      m.stub(:director).and_return('director name')
      Movie.should_receive(:find_movies_by_director).with('4')
      Movie.should_receive(:find).with('4').and_return(m)
      get :find_movies_by_director, {:id=>4}
    end
    it 'should select the Show Movie template for rendering' do
      m = mock('Movie')
      m.stub(:director).and_return('director name')
      Movie.stub(:find_movies_by_director)
      Movie.stub(:find).and_return(m)
      get :find_movies_by_director, {:id=>3}
      response.should render_template('show')
    end
    it 'should make the search results available to that template' do
      m = mock('Movie')
      m.stub(:director).and_return('director name')
      fake_movies = [mock('Movie'), mock('Movie')]
      Movie.stub(:find_movies_by_director).and_return(fake_movies)
      Movie.stub(:find).and_return(m)
      get :find_movies_by_director, {:id=>3}
      assigns(:movie).should == m
      assigns(:movies).should == fake_movies
    end
    it 'should return to home and show message if no director is available' do
      m = mock('Movie')
      m.stub(:director).and_return('')
      m.stub(:title).and_return('Movie Title')
      Movie.stub(:find_movies_by_director)
      Movie.stub(:find).and_return(m)
      get :find_movies_by_director, {:id=>3}
      response.should redirect_to(movies_path)
      flash[:notice].should == "'Movie Title' has no director info"
    end
  end
end
