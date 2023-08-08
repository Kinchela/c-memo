class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable

  validates :name, length: { maximum: 16,
    wrong_length: "%{count}文字以下"}
  validates :name_id, uniqueness: true, presence: true, 
    length: { in: 6..16, wrong_length: "%{count}文字の範囲"}

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

  def feed
    Micropost.where("user_id = ?", id)
  end

  has_many :children, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  has_many :microposts, dependent: :destroy
end
