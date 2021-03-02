class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  with_options presence: true do
    validates :nickname
    validates :image_attached
    validates :email, uniqueness: { case_sensitive: true, message: 'はもう登録されています' },
                      format: { with: VALID_EMAIL_REGEX, message: '@マークがありません' }

    with_options format: { with: PASSWORD_REGEX, message: '半角英数字のみ使用してください' } do
      validates :password
    end
  end

  has_many :recipes
  has_one_attached :image


  def image_attached
    # binding.pry
    errors.add(:image, :presence) if image.blank?
  end
end
