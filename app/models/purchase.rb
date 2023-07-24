class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :destination

  belongs_to :user
  belongs_to :item
  has_one :destination, dependent: :destroy
end