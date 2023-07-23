# require 'active_hash'
class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :quality
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days
  validates :name, :image, :price, :text, :genre_id, :quality_id, :payment_id, :prefecture_id, :days_id, presence: true
  validates :price, numericality: { less_than: 9_999_999, greater_than_or_equal_to: 300, only_integer: true }
  validates :price, format: { with: /\A[0-9]+\z/, message: 'must be half width number' }


  with_options numericality: { other_than: 0 } do
    validates :genre_id
    validates :quality_id
    validates :payment_id
    validates :prefecture_id
    validates :days_id
  end
  belongs_to :user
  has_one :purchase, dependent: :destroy
  has_one_attached :image
  has_many :items, dependent: :destroy
end
