require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる場合' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない場合' do
      it 'nicknameが空では登録できないこと' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できないこと' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'passwordが空では登録できないこと' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it '重複したemailが存在する場合登録できないこと' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がない場合保存ができない' do
        @user.email = 'test.test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email @マークがありません')
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字のみ使用してください')
      end

      it 'passwordが数字のみでは登録できない' do
        @user.password = '1111111'
        @user.password_confirmation = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字のみ使用してください')
      end

      it 'passwordが全角英数字のみでは登録できない' do
        @user.password = '１１１１ａａ'
        @user.password_confirmation = '１１１１ａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password 半角英数字のみ使用してください')
      end
    end
  end
end
