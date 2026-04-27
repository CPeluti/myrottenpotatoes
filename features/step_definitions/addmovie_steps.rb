
Given('I am on the RottenPotatoes home page') do
  visit movies_path rescue visit '/'
end

When('I follow {string}') do |link_text|
  click_link link_text
end

Then('I should be on the Create New Movie page') do
  expect(current_path).to match(/\/movies\/new|new_movie/)
end

When('I fill in {string} with {string}') do |field, value|
  fill_in field, with: value
end

When('I select {string} from {string}') do |value, field|
  begin
    select value, from: field
  rescue Capybara::ElementNotFound
    find("select[name*='#{field.downcase}']").select(value)
  end
end
When('I select {string} as the {string} date') do |date_string, label|
  date = Date.parse(date_string)
  begin
    fill_in label, with: date
  rescue
    begin
      find(:xpath, ".//select[contains(@id, '_1i')]").select(date.year.to_s)
      find(:xpath, ".//select[contains(@id, '_2i')]").select(date.strftime('%B'))
      find(:xpath, ".//select[contains(@id, '_3i')]").select(date.day.to_s)
    rescue Capybara::ElementNotFound
      all("select[id*='_i']").each_with_index do |element, index|
        case index % 3
        when 0 then element.select(date.year.to_s) rescue nil
        when 1 then element.select(date.strftime('%B')) rescue nil
        when 2 then element.select(date.day.to_s) rescue nil
        end
      end
    end
  end
end

When('I press {string}') do |button_text|
  begin
    click_button button_text
  rescue Capybara::ElementNotFound
    first('input[type="submit"], button[type="submit"], button').click
  end
end

Then('I should be on the RottenPotatoes home page') do
  expect(current_path).to match('/')
end

Then('I should see {string}') do |text|
  expect(page).to have_content(text)
end