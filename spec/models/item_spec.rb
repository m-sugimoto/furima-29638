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
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
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
      it "statusが1以外でないと登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status select")
      end
      it "categoryが1以外でないと登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category select")
      end
      it "postageが1以外でないと登録できない" do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage select")
      end
      it "prefectureが0以外でないと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture select")
      end
      it "sendingdayが1以外でないと登録できない" do
        @item.sendingday_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sendingday select")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが10,000,000以上では登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが299以下では登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "priceが全角だと登録できない" do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが半角英数混合では登録できない" do
        @item.price = 'aa1000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
      end
      it "priceが英語だけだと登録できない" do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number")
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
    end
  end
end