# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: 'only allows letters' }
  validates :email, presence: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is not a valid email address' }

  enum role: {
    user: 0,
    admin: 1
  }

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def self.search(term, column, direction)
    scope = user

    scope = scope.where('name ILIKE :term OR email = :term ', term: term.downcase.to_s) if term.present?

    scope.ordered(column, direction)
  end
end
