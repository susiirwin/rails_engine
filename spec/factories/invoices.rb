FactoryGirl.define do
  factory :invoice do
    status "MyText"
    merchant
    customer
  end
end
