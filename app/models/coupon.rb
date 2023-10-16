class Coupon < ApplicationRecord
  has_many :products, dependent: :nullify

  validates :name, presence: true
  validates :value, presence: true, numericality: { only_integer: true, message: 'must be a number' }


  def self.search(term, column, direction)
    scope = self

    scope = scope.where('name ILIKE :term ', term: term.downcase.to_s) if term.present?

    scope.ordered(column, direction)
  end
end
