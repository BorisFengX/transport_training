class Join < ApplicationRecord
  belongs_to :user
  belongs_to :competency
  has_many :evaluations, dependent: :destroy
  # belongs_to :team
  # belongs_to :domain

end
