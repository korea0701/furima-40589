FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    house_number { '1-1-1' }
    building_name { '青山マンション' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
