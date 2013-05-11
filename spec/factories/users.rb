# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n| 
    "simlegate#{n}@163.com"
  end

  factory :user do
    email
    password "123456"
    encrypted_password "$2a$10$i2IFrWNxB2npeFC2F\/LZ1eigE9wBGqbnmIq.Hak5NrCC5uPOpQtJ2"
    before(:create) { User.destroy_all }
  end
end
