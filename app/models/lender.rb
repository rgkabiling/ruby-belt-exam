class Lender < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates_confirmation_of :password
  validates :first_name, :last_name, :email, :money, presence: true, on: :create
  validates :password, presence: true, on: :create
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, on: :creat
  has_secure_password
  has_many :histories
  has_many :borrowers, through: :histories

end
