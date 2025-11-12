class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :item_name, presence: true
  validates :explanation, presence: true

  validates :price, presence: true
  validates :price, numericality: true
  validates :price, numericality: {greater_than: 300,less_than: 9_999_999}
  validates :image, presence: true

  validates :category, presence: true
  validates :condition, presence: true
  validates :shipping_fee, presence: true
  validates :prefecture, presence: true
  validates :shipping_day, presence: true

  validates :category_id, numericality: {other_than: 1}
  validates :condition_id, numericality: {other_than: 1}
  validates :shipping_fee_id, numericality: {other_than: 1}
  validates :prefecture_id, numericality: {other_than: 1}
  validates :shipping_day_id, numericality: {other_than: 1}

  belongs_to :user

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image
end
