# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
 
  sequence :content do |n| 
    "create log #{n}" 
  end

  factory :log do
    content
    isread false
  end
end
