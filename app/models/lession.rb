class Lession < ApplicationRecord
  has_many :lessions_courses, dependent: :destroy
  has_many :courses, through: :lessions_courses
end
