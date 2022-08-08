class Team < ApplicationRecord
  belongs_to :user
  belongs_to :order
end
