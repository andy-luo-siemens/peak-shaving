class Sem3Controller < ApplicationRecord
  belongs_to :sem3_gateway
  has_many :meters
end
