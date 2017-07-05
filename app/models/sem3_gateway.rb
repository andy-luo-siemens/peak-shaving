class Sem3Gateway < ApplicationRecord
  belongs_to :topology
  has_many :sem3_controllers
end
