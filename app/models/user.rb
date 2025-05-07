class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_initialize :set_default_role, if: :new_record?

  enum role:{buyer: 0, artisan: 1, admin:2 }
  has_many :products, dependent: :destroy

  def set_default_role
   self.role ||= 'buyer' if self.role.blank?
  end
end
