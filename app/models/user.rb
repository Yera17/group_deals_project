class User < ApplicationRecord
  has_many :subscriptions
  has_many :deals
  has_many :received_subscriptions, through: :deals, source: :subscriptions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
