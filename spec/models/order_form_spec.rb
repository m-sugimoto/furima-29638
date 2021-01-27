require 'rails_helper'
RSpec.describe OrderForm, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form,user_id: user.id,item_id: item.id)
      sleep 1
    end
    

    context '商品出品がうまく行く時' do
      it "postal_codeとprefecture_id,city,house_name,とtelnumberが存在すれば登録できる" do
        expect(@order_form).to be_valid
      end
    end


    context '商品購入がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @order_form.postal_code = '' 
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeにハイフンがないと登録できない" do
        @order_form.postal_code = '9990000' 
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it "prefectureが0以外でないと登録できない" do
        @order_form.prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture select")
      end
      it "prefectureが空では登録できない" do
        @order_form.prefecture_id= ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空だと登録できない" do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "cityが半角だと登録できない" do
        @order_form.city = '000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City is invalid")
      end
      it "house_numberが空では登録できない" do
        @order_form.house_number = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
      it "telnumberが空だと登録できない" do
        @order_form.telnumber = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telnumber can't be blank")
      end
      it "telnumberが全角だと登録できない" do
        @order_form.telnumber = '０９０１２３４５６７８'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telnumber Half-width number")
      end
      it "telnumberが9文字以下だと登録できない" do
        @order_form.telnumber = '000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telnumber is too short (minimum is 10 characters)")
      end
      it "telnumberが12文字以上だと登録できない" do
        @order_form.telnumber = '000000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telnumber is too long (maximum is 11 characters)")
      end
      it "tokenが空だと登録できない" do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "use_idが空だと登録できない" do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it "building_nameが空でも登録できる" do
        @order_form.building_name = nil
        @order_form.valid?
      end
    end
  end
end
