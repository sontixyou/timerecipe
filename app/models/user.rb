class User < ApplicationRecord
  ## Association
  has_many :recipes
  has_many :comments
  has_many :sns_credentials
  # has_one_attached :image
  
  ##Validation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

         
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

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    image_url = auth.info.image
    
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
      email: auth.info.email,
      image: URI.parse(image_url)
    )
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end

  # def image_attached
  #   binding.pry
  #   errors.add(:image, :presence) if image.blank?
  # end
end
