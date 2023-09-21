class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :ordered, ->(column = :id, direction = :desc) {
    order("#{column} #{direction}")
  }
end
