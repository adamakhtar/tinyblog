FactoryGirl.define do
  factory :author, :class => Tinyblog::Author do
    first_name "Ned" 
    sequence(:last_name)  { |n| "Flanders ##{n}" } 
  end
end 
