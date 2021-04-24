class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :timeoutable, :trackable

  has_one :user_profile

  class << self
    def all_role_users(page, per)
      self.all.order(created_at: :desc).page(page).per(per)
    end
  end
end
