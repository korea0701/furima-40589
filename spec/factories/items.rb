FactoryBot.define do
  factory :item do
    name { 'テストアイテム' }
    description { 'テスト用の説明文' }
    price { 500 }
    category_id { 2 } # 有効なidを設定（1は無効とするため）
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_day_id { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample_image.png'), filename: 'sample_image.png', content_type: 'image/png')
    end
  end
end
