require 'rails_helper'
RSpec.describe User, type: :model do
  before do
  @user = FactoryBot.build(:user)
  end
  

  describe '会員情報入力' do
  context  'ユーザ登録ができる時' do
  it "nickname , email , password , password_confirmation , last_name , first_name , last_name_kana , first_name_kana , birth_dateがあれば登録OK" do
    expect(@user).to be_valid
  end
  it "passwordが6文字以上で登録OK" do
    @user.password = "123456abc"
    @user.password_confirmation = "123456abc"
    expect(@user).to be_valid
  end
  end

  context  'ユーザ登録ができない時' do
  it "nicknameが空だと登録できない" do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end
  it "emailが空では登録できない" do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end
  it "emailに@がないと登録できない" do
    @user.email = "kkkgmail.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
  end
  it "重複したemailが存在すれば登録できない" do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
  end
  end
  it "passwordが空では登録できない" do
    @user.password = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it "passwordが6文字以下であれば登録できない" do
    @user.password = 00000
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "passwordが数字のみでは登録できない" do
    @user.password = 00000000
    @user.password_confirmation = 00000000
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
  end
  it "passwordが英語のみでは登録できない" do
    @user.password = "AAAAAA"
    @user.password_confirmation = "AAAAAA"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
  end
  it "passwordが全角では登録できない" do
    @user.password = "テストコード"
    @user.password_confirmation = "テストコード"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid. Input full-width characters.")
    end

  it "password_confirmationが空では登録できない" do
    @user.password = " "
    @user.password_confirmation = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank", "Password can't be blank", "Password is invalid. Input full-width characters.")
  end
  it "passwordとpassword_confirmationが不一致では登録できない" do
    @user.password = 123456
    @user.password_confirmation = 1234567
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it "名字が空だと登録できない" do
    @user.first_name = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("First name Full-width characters", "First name can't be blank")
  end
  it "名前が空だと登録できない" do
    @user.last_name = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name Full-width characters", "Last name can't be blank")
  end
  it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
    @user.first_name = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name Full-width characters")
  end
  it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
    @user.last_name = "kana"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name Full-width characters")
  end
  it "フリガナ（名字）が空だと登録できない" do
    @user.first_name_kana = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid. Input full-width katakana characters.")
  end
  it "フリガナ（名前）が空だと登録できない" do
    @user.last_name_kana = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid. Input full-width katakana characters.")
  end
  it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
    @user.first_name_kana = "日本"
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width katakana characters.")
  end
  it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
    @user.last_name_kana = "日本"
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width katakana characters.")
  end
  it "生年月日が空だと登録できない" do
    @user.birth_date = " "
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth date can't be blank")
  end
  
  end
  end