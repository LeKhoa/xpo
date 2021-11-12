class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :terms_and_conditions

  validates_acceptance_of :terms_and_conditions

  has_many :transactions, dependent: :destroy
  has_many :exchange_accounts, dependent: :destroy
end
