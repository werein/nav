require 'test_helper'

describe "Rails Admin Feature" do
  it "must have access to create new page" do 
    visit rails_admin.new_path(model_name: 'nav~navigation')
    within '#new_nav_navigation' do 
      page.has_content?('Name').must_equal true
      page.has_content?('Title').must_equal true
      page.has_content?('Subtitle').must_equal true
      page.has_content?('Locale').must_equal true
      page.has_content?('Permalink').must_equal true
      page.has_content?('Parent').must_equal true
    end
  end
end