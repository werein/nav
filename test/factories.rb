# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: Auth::User do 
    email 'test@gmail.com'
    password '12345678'
    confirmed_at Time.zone.now
  end
end

FactoryGirl.define do
  factory :navigation, class: Nav::Navigation do
    title 'Main'
    subtitle 'Main page'
    locale 'en'
    ancestry nil
    position 1
    permalink '/'
  end
end