FactoryGirl.define do
  factory :user do
    email 'adam@example.com'
    password '12345678'
    password_confirmation '12345678'
    admin false
  end
end 
