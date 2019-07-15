class Team < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  has_many :users, dependent: :destroy
  # has_many :joins, through: :users
end
