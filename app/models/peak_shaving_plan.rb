class PeakShavingPlan < ApplicationRecord
  belongs_to :user
  has_one :topology
end
