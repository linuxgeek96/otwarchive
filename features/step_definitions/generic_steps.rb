Given /^I wait (\d+) seconds?$/ do |number|
  Kernel::sleep number.to_i
end

When 'the system processes jobs' do
  Delayed::Job.work_off
end

When 'I reload the page' do
  visit current_url
end

Then /^I should see Posted now$/ do
	now = Time.now.to_s
  Given "I should see \"Posted #{now}\""
end

When /^I fill in "([^\"]*)" with$/ do |field, value|
  fill_in(field, :with => value)
end