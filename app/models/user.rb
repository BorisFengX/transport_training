class User < ApplicationRecord
  belongs_to :team
  has_many :joins
  has_many :competencies, through: :joins
end
