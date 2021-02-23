class Recipe < ApplicationRecord

  with_options presence: true do
    validates :title
    validates :time
    validates :how_to_cook
  end

  has_one_attached :image
end
