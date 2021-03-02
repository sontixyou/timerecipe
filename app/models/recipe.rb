class Recipe < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :time
    validates :how_to_cook
    validates :image_attached
  end

  has_one_attached :image
  belongs_to :user


  def image_attached
    errors.add(:image, :presence) if image.blank?
  end
end
