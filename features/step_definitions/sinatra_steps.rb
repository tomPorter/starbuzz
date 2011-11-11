When /^I go to (.*)$/ do |page|
  visit path_to(page)
end

Then /^I should see "([^\"]*)"$/ do |text|
  response_body.should =~ Regexp.new(Regexp.escape(text))
end
Then /^There should be hidden text "([^\"]*)"$/ do |text|
  response_body.should have_selector('.hideme',:content => text)
end
