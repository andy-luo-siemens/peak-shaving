class EvseGateway < ApplicationRecord
  belongs_to :topology
  has_many :evses
end
