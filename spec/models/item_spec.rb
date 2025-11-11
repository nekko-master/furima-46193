require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の保存' do
    context '出品できる場合' do
      it '全ての項目に値があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないる場合' do
      # it '商品画像がないと出品できない' do
      #   @item.image.detach
      #   @item.valid?
      #   expect(@item.errors.full_messages).to include("")
      # end
      it '商品名がないと出品できない' do
        @item.item_name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明がないと出品できない' do
        @item.explanation = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がないと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category_id can't be blank")
      end
      # it '商品の状態情報がないと出品できない' do
      #   expect(@user).to be_valid
      # end
      # it '配送料負担の情報がないと出品できない' do
      #   expect(@user).to be_valid
      # end
      # it '発送元の地域情報がないと出品できない' do
      #   expect(@user).to be_valid
      # end
      # it '発送までの日数情報がないと出品できない' do
      #   expect(@user).to be_valid
      # end
      # it '価格情報がないと出品できない' do
      #   expect(@user).to be_valid
      # end
    end
  end
end
