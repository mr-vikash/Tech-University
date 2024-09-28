class Course < ApplicationRecord
  validates :short_name, presence: true
  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
end
