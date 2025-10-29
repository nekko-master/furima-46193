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
    it "「新規登録」ボタンをクリックすると、新規登録ページに遷移しユーザー新規登録できる" do
      click_link '新規登録'
      expect(page).to have_current_path('new_user_registration_path')
      # fill_in 'Nickname', with: @user.nickname
      # fill_in 'Email', with: @user.email
      # fill_in 'Password', with: @user.password
      # fill_in 'Last_name', with: @user.last_name
      # fill_in 'First_name', with: @user.first_name
      # fill_in 'Last_name_kana', with: @user.last_name_kana
      # fill_in 'First_name_kana', with: @user.first_name_kana
      # fill_in 'Birthday', with: @user.birthday
      # expect{
      #   find('input[name="commit"]').click
      #   sleep 1
      # }.to change { User.count }.by(1)
    end

#    it "ログイン状態の場合には、「ユーザーのニックネーム」と「ログアウト」ボタンが表示される" do
#      expect(page).to have_content(@user.nickname)
#      expect(page).to have_content('ログアウト')
#    end
#     it "「新規登録」「ログイン」ボタンをクリックすると、各ページに遷移できる" do
# find('新規登録').click expect(page).to have_current_path('new_user_registration_path')
# find('ログイン').click expect(page).to have_current_path('new_user_session_path')
#     end
#     it "「ログアウト」ボタンをクリックすると、ログアウトができる" do
# find('新規登録').click expect(page).to have_current_path('new_user_session_path')
#     end
  end
end