class Sem3Gateway < ApplicationRecord
  has_many :sem3_controllers
  belongs_to :user
end
