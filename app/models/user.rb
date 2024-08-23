class User < ApplicationRecord
  has_many :subscriptions
  has_many :deals, dependent: :destroy
  has_many :received_subscriptions, through: :deals, source: :subscriptions, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
