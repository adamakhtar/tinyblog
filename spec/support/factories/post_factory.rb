FactoryGirl.define do
  factory :post, :class => Tinyblog::Post do
    sequence(:title) { |n| "Amazing post ##{n}" } 
    body "blahblahblah"

    factory :post_with_author do
      association :author
    end
  end
end 
