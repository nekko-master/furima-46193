class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :item_name
    validates :explanation

    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
    validates :category
    validates :condition
    validates :shipping_fee
    validates :prefecture
    validates :shipping_day

    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :shipping_day_id
  end

  belongs_to :user

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :shipping_day

  has_one_attached :image

  has_one    :order
end
