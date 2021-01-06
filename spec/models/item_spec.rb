require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまく行く時' do
      it "commodityとexplan,status_id,category_id,postage_id,prefecture_id,sendingday_id,とpriceが存在すれば登録できる" do
        user = FactoryBot.create(:user)
        expect(@item).to be_valid
      end
      it "priceは¥300~¥9,999,999の間であること" do
       @item.price = "5000"
       expect(@item).to be_valid
      end
      it "priceが半角数字であれば登録できる" do
        @item.price = "5000"
        expect(@item).to be_valid
      end
      it "画像とテキストがあれば投稿できる" do
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "commodityが空だと登録できない" do
        @item.commodity = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Commodity can't be blank")
      end      
      it "explanが空では登録できない" do
        @item.explan = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explan can't be blank")
      end
      it "statusが空では登録できない" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "categoryが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "postageが空だと登録できない" do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it "prefectureが空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "sendingdayが空だと登録できない" do
        @item.sendingday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sendingday can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end