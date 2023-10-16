class Product < ApplicationRecord
  belongs_to :category
  belongs_to :coupon, optional: true
  has_one_attached :product_img

  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true, message: "must be a number" }
  validates :description, presence: true, length: { minimum: 20, message: "must be at least 20 characters long" }

  enum status: {
    publish: 0,
    draft: 1,
    pending: 2
  }

  def self.search(term, column, direction)
    scope = self

    scope = scope.where("title ILIKE :term ", term: "#{term.downcase}") if term.present?

    scope.ordered(column, direction)
  end

  def self.product_show
    scope = self.publish.joins(:category).where(categories: {availability: 'active'})
  end

end


