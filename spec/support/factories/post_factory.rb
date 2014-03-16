FactoryGirl.define do
  factory :post, :class => Tinyblog::Post do
    sequence(:title) { |n| "Amazing post ##{n}" } 
    body "blahblahblah"
  end
end 
