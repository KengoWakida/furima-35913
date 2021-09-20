class Order < ApplicationRecord
  has_many :shipping
  belongs_to :items
  belongs_to :user
end
