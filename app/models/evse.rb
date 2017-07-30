class Evse < ApplicationRecord
  belongs_to :evse_gateway
  belongs_to :user
  belongs_to :peak_shaving_plan, optional: true
end
