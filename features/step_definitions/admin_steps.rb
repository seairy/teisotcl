# -*- encoding : utf-8 -*-
When /^I go to the admin signin page$/ do
  visit admin_signin_path
end

Given /^I fill in "([^"]*)" with "([^"]*)"$/ do |arg1, arg2|
  fill_in(arg1, :with => arg2)
end
 
When /^I press "([^"]*)"$/ do |arg1|
  click_link arg1
end
 
Then /^I should be on the admin signin page$/ do
  page.should have_content('登录')
end

Then /^I should be on the admin dashboard page$/ do
  page.should have_content('控制面板')
end

Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end