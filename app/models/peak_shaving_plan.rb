class PeakShavingPlan < ApplicationRecord
  belongs_to :user
  has_many :meters
  has_many :evses
end
