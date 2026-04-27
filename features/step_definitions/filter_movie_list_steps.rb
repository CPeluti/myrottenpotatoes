# features/step_definitions/filter_movie_list_steps.rb
Then /^(\d+) movies should exist$/ do |n_seeds|
  expect(Movie.count).to eq n_seeds.to_i
end


When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  ratings = rating_list.split(',').map(&:strip)
  ratings.each do |rating|
    field_id = "ratings_#{rating}"
    uncheck ? uncheck(field_id) : check(field_id)
  end
end

Then /I should see (\d+) movies/ do |count|
  rows = page.all('table#movies tbody tr').count
  expect(rows).to eq count.to_i
end


Then /I should see all the movies/ do
  rows = page.all('table#movies tbody tr').count
  expect(rows).to eq Movie.count
end

