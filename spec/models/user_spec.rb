require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nickname、email、password、名前、名前カナ、生年月日があれば登録できる" do
    end
    it "nicknameが空では登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
    end
    it "last_nameが空では登録できない" do
    end
    it "first_nameが空では登録できない" do
    end
    it "last_name_kanaが空では登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "birthdayが空では登録できない" do
    end
    it "emailは@を含まないと登録できない" do
    end
    it "passwordが5文字以下では登録できない" do
    end
    it "passwordが129文字以上では登録できない" do
    end
  end
end