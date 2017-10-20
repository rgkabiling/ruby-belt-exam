class Borrower < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates_confirmation_of :password
  validates :first_name, :last_name, :email, :password, :purpose, :description, :money, presence: true
  has_secure_password
  has_many :histories
  has_many :lenders, through: :histories

end
