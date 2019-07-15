class Competency < ApplicationRecord
  # validates :name, presence: true, uniqueness: true
  # has_many :domains, dependent: :destroy
  belongs_to :domain
  has_many :joins
  has_many :users, through: :joins
end
