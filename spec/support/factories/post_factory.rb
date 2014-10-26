FactoryGirl.define do
  factory :post, :class => Tinyblog::Post do
    sequence(:title) { |n| "Amazing post ##{n}" } 
    body "blahblahblah"
    association :author

    trait :published do
      workflow_state 'published'
    end

    trait :drafting do
      workflow_state 'drafting'
    end 

    trait :trashed do
      deleted_at 3.days.ago
    end
  end
end 
