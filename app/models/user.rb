class User < ApplicationRecord
  ## Association
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  # has_one_attached :image
  
  ##Validation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  with_options presence: true do
    validates :nickname
    # validates :image_attached
    validates :email, uniqueness: { case_sensitive: true, message: 'はもう登録されています' },
                      format: { with: VALID_EMAIL_REGEX, message: '@マークがありません' }

    with_options format: { with: PASSWORD_REGEX, message: '半角英数字のみ使用してください' } do
      validates :password
    end
  end

  def favorite_by?(recipe_id)
    favorites.where(recipe_id: recipe_id).exists?
  end  
end
