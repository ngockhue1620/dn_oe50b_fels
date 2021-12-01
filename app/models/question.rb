class Question < ApplicationRecord
  has_many :answers
  belongs_to :lession
  has_many :exam_details, dependent: :destroy
end
