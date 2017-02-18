class User < ApplicationRecord

  has_secure_password
  validates :name, presence: true
  validates :password, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :age, numericality: { greater_than: 7 }

  has_many :games
  has_many :scores, through: :games


end
