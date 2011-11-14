When /^I go to (.*)$/ do |page|
  visit path_to(page)
end

Then /^I should see "([^\"]*)"$/ do |text|
  response_body.should =~ Regexp.new(Regexp.escape(text))
end
Then /^there should be hidden text "([^\"]*)"$/ do |text|
  #response_body.should have_selector('.hideme',:content => text)
  response.body.should have_selector("#content") do |content|
    content.should have_selector('.hideme') do |hidden|
      hidden.should have_selector('h3',:content => text)
    end
  end
end
