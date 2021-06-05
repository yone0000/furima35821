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
    it "usernameが8文字以下で登録OK" do
    @user.username = "abcd5678" 
    expect(@user).to be_valid
    end
    it "passwordが6文字以上で登録OK" do
    @user.password = "123456"
    @user.password_confirmation = "123456"
    expect(@user).to be_valid
    end
    end

  context  'ユーザ登録ができない時' do
  it "nicknameが空だと登録できない" do
  @user.nickname = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Nickname can't be blank")
  end
  it "emailが空では登録できない" do
  @user.email = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Email can't be blank")
  end
  it "emailに@がないと登録できない" do
  @user.email = "kkkgmail.com"
  @user.valid?
  expect(@user.errors_full_messages).to include("Email is invalid")
  end
  it "重複したemailが存在すれば登録できない" do
  @user.save
  another_user.email = FactoryBot.build(:user, email:@user.email)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors_full_messages).to include("Email has already been taken")
  end
  it "passwordが空では登録できない" do
  @user.password = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Password can't be blank")
  end
  it "passwordが6文字以下であれば登録できない" do
  @user.password = "000000"
  @user.valid?
  expect(@user.errors_full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  it "passwordが数字のみでは登録できない" do
  @user.password = "111111"
  @user.valid?
  expect(@user.errors_full_messages).to include("Password Include both letters and numbers")
  end
  it "passwordが全角では登録できない" do
    @user.password = "１１１１１１"
    @user.valid?
    expect(@user.errors_full_messages).to include("Password Include both letters and numbers")
    end

  it "password_confirmationが空では登録できない" do
  @user.password_confirmation = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Password_confirmation can't be blank")
  end
  it "passwordとpassword_confirmationが不一致では登録できない" do
  @user.password = "123456"
  @user.password_confirmation = "1234567"
  @user.valid?
  expect(@user.errors_full_messages).to include("Password confirmation doesn't match Password")
  end
  it "名字が空だと登録できない" do
  @user.first_name = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("First_name can't be blank")
  end
  it "名前が空だと登録できない" do
  @user.family_name = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Family_name can't be blank")
  end
  it "名字は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
  @user.first_name = "kana"
  @user.valid?
  expect(@user.errors_full_messages).to include("First_name Full-width characters")
  end
  it "名前は全角（漢字・ひらがな・カタカナ）でなければ登録できない" do
  @user.family_name = "kana"
  @user.valid?
  expect(@user.errors_full_messages).to include("Family_name Full-width characters")
  end
  it "フリガナ（名字）が空だと登録できない" do
  @user.first_name_kana = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("First_name_kana can't be blank")
  end
  it "フリガナ（名前）が空だと登録できない" do
  @user.family_name_kana = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Family_name_kana can't be blank")
  end
  it "名字のフリガナは全角（カタカナ）でなければ登録できない" do
  @user.first_name = "かな"
  @user.valid?
  expect(@user.errors_full_messages).to include("First_name Full-width characters")
  end
  it "名前のフリガナは全角（カタカナ）でなければ登録できない" do
  @user.family_name = "かな"
  @user.valid?
  expect(@user.errors_full_messages).to include("Family_name Full-width characters")
  end
  it "生年月日が空だと登録できない" do
  @user.birth_day = nil
  @user.valid?
  expect(@user.errors_full_messages).to include("Birth_day can't be blank")
  end
  end
  
  end
  end