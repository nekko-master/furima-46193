require 'rails_helper'

RSpec.describe User, type: :model do

  context "ユーザー新規登録できる場合" do
    it "nickname、email、password、名前、名前カナ、生年月日があれば登録できる" do
    end
  end

  context "新規登録/ユーザー情報" do
    it "nicknameが空では登録できない" do
    end
    it "emailが空では登録できない" do
    end
    it "emailが重複すると登録できない" do
    end
    it "emailは@を含まないと登録できない" do
    end
    it "passwordが空では登録できない" do
    end
    it "passwordが5文字以下では登録できない" do
    end
    it "passwordは、半角英数字混合でないと登録できない" do
    end
    it "passwordとpassword_confirmationが不一致では登録できない" do
    end
  end

  context "新規登録/本人情報確認" do
    it "last_nameが空では登録できない" do
    end
    it "last_nameは全角でないと登録できない" do
    end
    it "first_nameが空では登録できない" do
    end
    it "first_nameは全角でないと登録できない" do
    end
    it "last_name_kanaが空では登録できない" do
    end
    it "last_name_kanaは全角（カタカナ）でないと登録できない" do
    end
    it "first_name_kanaが空では登録できない" do
    end
    it "first_name_kanaは全角（カタカナ）でないと登録できない" do
    end
    it "birthdayが空では登録できない" do
    end
  end

  context "トップページ" do
    it "ログアウト状態の場合には、「新規登録」「ログイン」ボタンが表示される" do
    end
    it "ログアウト状態の場合には、「ユーザーのニックネーム」と「ログアウト」ボタンが表示される" do
    end
    it "「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できる" do
    end
    it "「ログアウト」ボタンをクリックすると、ログアウトができる" do
    end
  end

end