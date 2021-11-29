class Course < ApplicationRecord
  has_many :users_course, dependent: :destroy
  has_many :users, through: :users_course
  has_many :lessions_course, dependent: :destroy
  has_many :lessions, through:  :lessions_course
end
