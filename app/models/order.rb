class Order < ApplicationRecord
  has_many :shipping
  belongs_to :item
  belongs_to :user
end
