class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  validates :name, :description, :image, presence: true
  validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id, presence: true,
                                                                                             numericality: { other_than: 1, message: 'Please select' }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'must be between ¥300 and ¥9,999,999' }
end
