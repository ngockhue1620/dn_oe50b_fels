class User < ApplicationRecord
  has_many :users_courses, dependent: :destroy
  has_many :courses, through: :users_courses
  has_secure_password
end
