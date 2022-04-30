FactoryBot.define do
  factory :transaction do
    transaction_id { Transaction.trans_generator }
    input_amt { "#{Faker::Number.decimal(l_digits: 2)}" }
    input_currency { Faker::Currency.code }
    output_amt { "#{Faker::Number.decimal(l_digits: 2)}" }
    output_currency { Faker::Currency.code }
    is_active { true }
  end
end
