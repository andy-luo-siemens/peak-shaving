class Sem3Gateway < ApplicationRecord
  belongs_to :peak_shaving_plan
  has_many :sem3_controllers
end
