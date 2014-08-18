FactoryGirl.define do
  factory :post, :class => Tinyblog::Post do
    sequence(:title) { |n| "Amazing post ##{n}" } 
    body "blahblahblah"
    association :author

    trait :published do
      workflow_state 'published'
    end
  end
end 
