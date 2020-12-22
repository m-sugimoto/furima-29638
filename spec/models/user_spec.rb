require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、firstname,name,firstname_reading,name_reading,birthday,passwordとpassword_confirmationが存在すれば登録できる" do
       expect(@user).to be_valid
      end
      it "nicknameが6文字以下で登録できる" do
       @user.nickname = "aaaaaa"
       expect(@user).to be_valid
      end
      it "passwordが半角英数字両方含めて6文字以上であれば登録できる" do
        @user.password = "a00000"
        @user.password_confirmation = "a00000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end      
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは＠がないと登録できない" do
        @user.email = "aaagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "a0000"
        @user.password_confirmation = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英字と数字両方を含めてないと登録できない" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "firstnameが空だと登録できない" do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it "firstnameが全角でないと登録できない" do
        @user.firstname = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it "nameが空だと登録できない" do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it "nameが全角でないと登録できない" do
        @user.name = 'ｱｲｳｴｵ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name is invalid")
      end
      it "firstname_readingが空だと登録できない" do
        @user.firstname_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname reading can't be blank")
      end
      it "firstname_readingがカタカナでないと登録できない" do
        @user.firstname_reading = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname reading is invalid")
      end
      it "name_readingが空だと登録できない" do
        @user.name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading can't be blank")
      end
      it "name_readingがカタカナでないと登録できない" do
        @user.name_reading = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include("Name reading is invalid")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end