class Sem3Gateway < ApplicationRecord
  belongs_to :topology, optional: true
  has_many :sem3_controllers
end
