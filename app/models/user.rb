class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  validates :name, uniqueness: true

  def email_required?
    false
  end

  def will_save_change_to_email?
    false
  end

  def feed
    Micropost.where("user_id = ?", id)
  end

  has_many :children #, dependent: :destroy
  has_many :wishlists #, dependent: :destroy
  has_many :microposts, dependent: :destroy
end
