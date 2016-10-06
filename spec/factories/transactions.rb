FactoryGirl.define do
  factory :transaction do
    credit_card_number "MyText"
    result "Success"
    invoice
  end
end
