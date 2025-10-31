require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context "トップページ" do
    it "ログアウト状態の場合には、「新規登録」「ログイン」ボタンが表示される" do
      visit root_path
      expect(page).to have_content('新規登録')
      expect(page).to have_content('ログイン')
    end
    it "「新規登録」ボタンをクリックすると、新規登録ページに遷移しユーザー新規登録できる
    ログイン状態の場合には、「ユーザーのニックネーム」と「ログアウト」ボタンが表示される
    「ログアウト」ボタンをクリックすると、ログアウトができる
    「ログイン」ボタンをクリックすると、ログインができる" do
      visit root_path
      click_link '新規登録'
      expect(page).to have_current_path(new_user_registration_path)
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password
      fill_in 'last-name', with: @user.last_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'last-name-kana', with: @user.last_name_kana
      fill_in 'first-name-kana', with: @user.first_name_kana
      select '2000', from: 'user[birthday(1i)]'
      select '1', from: 'user[birthday(2i)]'
      select '1', from: 'user[birthday(3i)]'
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(1)

      # ログイン状態の場合には、「ユーザーのニックネーム」と「ログアウト」ボタンが表示される
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログアウト')

      # 「ログアウト」ボタンをクリックすると、ログアウトができる
      click_link 'ログアウト'
      expect(page).to have_current_path(root_path)

      # 「ログイン」ボタンをクリックすると、ログインができる
      click_link 'ログイン'
      expect(page).to have_current_path(new_user_session_path)
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      find('input[name="commit"]').click
      
      expect(page).to have_content(@user.nickname)
      expect(page).to have_content('ログアウト')
      expect(page).to have_no_content('ログイン')

    end
  end
end