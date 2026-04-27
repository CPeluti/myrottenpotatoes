Dado /que eu estou na pagina inicial/ do
    visit movies_path rescue visit '/'
end

Quando /Eu aperto o botão de adicionar filme/ do
    click_link 'Add new movie'
end

Então /Eu devo ser redirecionado para a pagina de criar filme/ do
    expect(page).to have_current_path("/movies/new")
end

Then /Eu devo ver os inputs/ do
    expect(page).to have_css("#movie_title")
    expect(page).to have_css("#movie_rating")
    expect(page).to have_selector('select[id^="movie_release_date"]', count: 3)
end