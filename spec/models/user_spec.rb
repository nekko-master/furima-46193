require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録できる場合' do
    it 'nickname、email、password、名前、名前カナ、生年月日があれば登録できる' do
      expect(@user).to be_valid
    end
  end

  context '新規登録/ユーザー情報' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが重複すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'emailは@を含まないと登録できない' do
      @user.email = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空では登録できない' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが5文字以下では登録できない' do
      @user.password = '1234a'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordは半角数字のみではと登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordが英字のみでは登録できない'do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordが全角文字を含むと登録できない'do
      @user.password = '1234aＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '12345a'
      @user.password_confirmation = '12345b'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end

  context '新規登録/本人情報確認' do
    it 'last_nameが空では登録できない' do
      @user.last_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameは全角でないと登録できない' do
      @user.last_name = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name is invalid'
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameは全角でないと登録できない' do
      @user.first_name = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name is invalid'
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'last_name_kanaは全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana is invalid'
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaは全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana is invalid'
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
end
