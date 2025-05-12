class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  after_initialize :set_default_role, if: :new_record?
  after_create :create_cart

  enum role:{buyer: 0, artisan: 1, admin:2 }
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one :cart, dependent: :destroy
  def set_default_role
   self.role ||= 'buyer' if self.role.blank?
  end

  def create_cart
    Cart.create(user: self)
  end
end
