class User < ApplicationRecord
  enum role: {users: 0, admin: 1}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
