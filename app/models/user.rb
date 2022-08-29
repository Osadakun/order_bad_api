# frozen_string_literal: true

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:name]
  include DeviseTokenAuth::Concerns::User

  has_many :posts, dependent: :destroy
  # idカラムを基にordersテーブルのusers_idにアクセスできる
  has_many :order
  # idカラムを基にteamsテーブルのusers_idにアクセスできる
  has_many :team
  validates :name, presence: true, uniqueness: true
end
