class Product < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true, message: "must be a number" }
  validates :description, presence: true, length: { minimum: 20, message: "must be at least 20 characters long" }
  enum status: {
    publish: 0,
    draft: 1,
    pending: 2
  }

end
