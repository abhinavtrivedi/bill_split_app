FactoryGirl.define do
  factory :expense do
    name Faker::Company.name
    amount 100
  end
end