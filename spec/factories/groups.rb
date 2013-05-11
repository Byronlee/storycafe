# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :title do |n| 
    n == 1 ? "public" : "public#{n}"
  end
  factory :group do
    title
    description "this is group description"
    user
    factory :group_with_stories do
      ignore do
        posts_count 5
      end
      after (:create) do |group,evaluator|
        create_list(:story,evaluator.posts_count,group: group)
      end
    end
  end
end
