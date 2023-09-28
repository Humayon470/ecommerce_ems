# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :ordered, lambda { |column = :id, direction = :desc|
    order("#{column} #{direction}")
  }
end
