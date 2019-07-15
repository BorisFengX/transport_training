class Domain < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  has_many :competencies, dependent: :destroy
  # has_many :joins, through: :competencies
end
