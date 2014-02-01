# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class: Auth::User do 
    email 'test@gmail.com'
    password '12345678'
    confirmed_at Time.zone.now
  end
end
