class EvseGateway < ApplicationRecord
  belongs_to :peak_shaving_plan
  has_many :evses
end
