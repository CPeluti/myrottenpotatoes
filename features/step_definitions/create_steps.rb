Given /I am on the index page/ do
    visit '/'
end

When /I click the create button/ do
    click_link 'Add new movie'
end

Then /I should be redirected to the create page/ do
    expect(page).to have_current_path("/movies/new")
end

Then /I should see the inputs/ do
    expect(page).to have_css("#movie_title")
    expect(page).to have_css("#movie_rating")
    expect(page).to have_selector('select[id^="movie_release_date"]', count: 3)
end