class Recipe < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :recipe_time

  with_options presence: true do
    validates :title, length: { maximum: 40,
      too_long: '最大%{count}文字まで使えます' }
    with_options length: { maximum: 140,
      too_long: '最大%{count}文字まで使えます' } do
      validates :detail
      validates :recipe_info1
      validates :recipe_info2
      validates :recipe_info3
      validates :recipe_info4
      validates :recipe_info5
    end  
    validates :recipe_time
    validates :image_attached
  end

  def image_attached
    errors.add(:image, :presence) if image.blank?
  end
end
