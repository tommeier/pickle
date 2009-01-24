# this file generated by script/generate pickle page.
# You should edit the page_to_path method below for your own app's needs

# When I go to /sessions/new
When(/^I go to \/(.+?)$/) do |path|
  visit "/#{path}"
end

# Then I should be at /sessions/new
Then(/^I should be at \/(.+?)$/) do |path|
  request.path.should =~ /^\/#{path}/
end

# When I go to the posts's new comment page
When(/^I go to (.+?) page$/) do |page|
  visit page_to_path(page)
end

# Then I should be at the posts's new comment page
Then(/^I should be at (.+?) page$/) do |page|
  request.path.should =~ /^#{page_to_path(page)}/
end

# passed a string like 'the home', returns a path
def page_to_path(page)
  case page
  # add your own app-specific mappings, e.g.
  #
  # when 'the home'
  #   '/'
  #
  # when /$#{capture_model}'s activation^/
  #   activation_by_code_path(created_model($1).activation_code)
    
  when /^#{capture_model}'s$/                           # the forum's
    pickle_path $1
    
  when /^#{capture_model}'s #{capture_model}'s$/        # the forum's post's
    pickle_path $1, $2

  when /^#{capture_model}'s #{capture_model}'s (.+?)$/  # the forum's post's comments
    pickle_path $1, $2, :extra => $3

  when /^#{capture_model}'s (.+?)$/                     # the post's comments
    pickle_path $1, :extra => $2

  when /^the (.+?)$/                                    # the new session
    send "#{$1.downcase.gsub(' ','_')}_path"
    
  else
    raise "Could not map '#{page}' page to a path"
  end
end