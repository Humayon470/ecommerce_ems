# frozen_string_literal: true

class Coupon < ApplicationRecord
  has_many :products

  validates :name, presence: true
  validates :value, presence: true, numericality: { only_integer: true, message: 'must be a number' }

  before_destroy :remove_coupon_reference_from_products

  def self.search(term, column, direction)
    scope = self

    scope = scope.where('name ILIKE :term ', term: term.downcase.to_s) if term.present?

    scope.ordered(column, direction)
  end

  private

  def remove_coupon_reference_from_products
    products.update_all(coupon_id: nil)
  end
end
