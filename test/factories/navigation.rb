# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :navigation, class: Nav::Navigation do
    sequence(:name) {|n| "navigation-#{n}" } 
    title 'Main'
    subtitle 'Main page'
    locale 'en'
    ancestry nil
    position 1
    permalink '/'
  end
end