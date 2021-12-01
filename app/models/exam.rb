class Exam < ApplicationRecord
  belongs_to :user
  has_many :exam_details, dependent: :destroy
end
