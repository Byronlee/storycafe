# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :name do |n| 
    n == 1 ? "story" : "storycafe#{n}"
  end
  factory :project do
    name
  end
end
