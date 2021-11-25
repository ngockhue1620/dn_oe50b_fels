class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :users_course
  has_many :lessions_courses, dependent: :destroy
  has_many :lessions, through:  :lessions_courses
end
