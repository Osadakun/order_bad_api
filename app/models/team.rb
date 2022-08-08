class Team < ApplicationRecord
  # user_idとusersテーブルのidを関連づける
  # ref:https://railsguides.jp/association_basics.html
  has_one :user
  belongs_to :order
end
