class User < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "is not a valid email address" }
  
  enum role: {
    user: 0,
    admin: 1
  }

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  def self.search(term, column, direction)
    scope = self.user

    scope = scope.where("name = :term OR email = :term ", term: "#{term.downcase}") if term.present?

    scope.ordered(column, direction)
  end
end

