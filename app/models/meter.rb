class Meter < ApplicationRecord
  belongs_to :sem3_controller
  belongs_to :user
  belongs_to :peak_shaving_plan, optional: true

end
