class EvseGateway < ApplicationRecord
  has_many :evses
  belongs_to :user
end
