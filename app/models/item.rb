class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :delivery_date
  
  with_options presence: true do
    validates :image
    validates :title
    validates :explanation
  end
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :delivery_date_id
  end
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: 'には半角数字を入力してください'}, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'は販売価格の範囲外です' }
end