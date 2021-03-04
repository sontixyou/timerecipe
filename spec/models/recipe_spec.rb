require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#create' do
    before do
      @recipe = FactoryBot.build(:recipe)
    end

    context 'レシピを投稿できる場合' do
      it '全ての項目が存在していれば商品を出品できること' do
        expect(@recipe).to be_valid
      end
    end

    context 'レシピを投稿できない場合' do
      it '料理画像が空だとレシピを投稿できない' do
        @recipe.image = nil
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('Image translation missing: en.activerecord.errors.models.recipe.attributes.image.presence')
      end

      it '料理名が空だとレシピを投稿できない' do
        @recipe.title = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Title can't be blank")
      end

      it '料理の説明が空だとレシピを投稿できない' do
        @recipe.detail = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Detail can't be blank")
      end

      it '料理の具材が空だとレシピを投稿できない' do
        @recipe.item = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Item can't be blank")
      end

      it '料理の時間が空だと料理を投稿できない' do
        @recipe.recipe_time_id = 1
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include('Recipe time is not a number')
      end

      it '料理の手順１が空だとレシピを投稿できない' do
        @recipe.recipe_info1 = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Recipe info1 can't be blank")
      end

      it '料理の手順２が空だとレシピを投稿できない' do
        @recipe.recipe_info2 = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Recipe info2 can't be blank")
      end
    
      it '料理の手順３が空だとレシピを投稿できない' do
        @recipe.recipe_info3 = ''
        @recipe.valid?
        expect(@recipe.errors.full_messages).to include("Recipe info3 can't be blank")
      end

      it '料理のタイトルが141字以上だとレシピを投稿できない' do
        
      end

      it '料理の説明が141字以上だとレシピを投稿できない' do
        
      end

      it '料理の手順１が141字以上だとレシピを投稿できない' do
        
      end

      it '料理の手順２が141字以上だとレシピを投稿できない' do
        
      end

      it '料理の手順３が141字以上だとレシピを投稿できない' do
        
      end

      it '料理の手順４が141字以上だとレシピを投稿できない' do
        
      end

      it '料理の手順５が141字以上だとレシピを投稿できない' do
        
      end
    end  
  end
end
