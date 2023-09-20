class User < ApplicationRecord
  enum role: {users: 0, admin: 1}

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  
  def self.search(search_params)
    return self.where(role: 'users') unless search_params.present?

    where("name = :term OR email = :term ", term: "#{search_params}")
  end
  def self.sort_by_column(column, direction)
    sortable_columns = %w[id name email]
      if sortable_columns.include?(column)
        order("#{column} #{direction}")
      else
        order(id: :asc)
      end
  end
end

