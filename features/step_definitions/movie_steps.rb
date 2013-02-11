Given /the following movies exist/ do |movie_table|
  movie_table.hashes.each do |movie|
    Movie.create(movie)
  end
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  page.body.should =~ /^.*<td>#{e1}<\/td>.*<td>#{e2}<\/td>.*$/m
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(/[,|\s]+/).each do |w|
    if (uncheck!="un")
      step %{I check "ratings[#{w}]"}
	else
	  step %{I uncheck "ratings[#{w}]"}
    end
  end
end

Then /I should see all of the movies/ do
  page.all('tbody tr').count.should == 10
end

Then /I should not see any of the movies/ do
  page.all('tbody tr').count.should == 0
end

Then /the director of "(.*)" should be "(.*)"/ do |title,director|
  m = Movie.find_by_title(title)
  m.director == director
end
