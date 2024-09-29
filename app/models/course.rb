class Course < ApplicationRecord
  validates :short_name, presence: true
  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  has_many :student_courses
  has_many :students, through: :student_courses
end
