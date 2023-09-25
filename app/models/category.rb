class Category < ApplicationRecord
  has_many :products

  validates :name, presence: true

  enum availability: {
    active: 0,
    inactive: 1
  }
end
