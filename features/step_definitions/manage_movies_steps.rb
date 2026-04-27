Given('the following movies exist:') do |movies_table|
  movies_table.hashes.each do |movie|
    movie['release_date'] = Date.parse(movie['release_date']) if movie['release_date']
    Movie.create!(movie)
  end
end

Given('I am on the details page for {string}') do |title|
  movie = Movie.find_by(title: title)
  visit movie_path(movie)
end

Then('I should be on the details page for {string}') do |title|
  movie = Movie.find_by(title: title)
  expect(current_path).to eq movie_path(movie)
end

Then('I should not see {string}') do |text|
  expect(page).to have_no_content(text)
end