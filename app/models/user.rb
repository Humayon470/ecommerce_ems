class User < ApplicationRecord
  enum role: {users: 0, admin: 1}

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  def self.search(search_params)
    return self.where(role: 'users') unless search_params.present?

    where("name = :term OR email = :term ", term: "#{search_params}")
  end
end