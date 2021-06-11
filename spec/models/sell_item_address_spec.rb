require 'rails_helper'

RSpec.describe SellItemAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item)
      item.image = fixture_file_upload('app/assets/images/IMG_1368.JPG')
      item.save
      @sell_item_address = FactoryBot.build(:sell_item_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end
  
    context '内容に問題ない場合' do
      it "全ての情報が間違いなければ保存ができること" do
        expect(@sell_item_address).to be_valid
      end
      it "建物名が空でも保存ができること" do
        @sell_item_address.building = " "
        @sell_item_address.valid?
        expect(@sell_item_address).to be_valid
      end
    end
  
    context '内容に問題がある場合' do
      it "user_idが無い場合は登録できないこと" do
        @sell_item_address.user_id = " "
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが無い場合は登録できないこと" do
        @sell_item_address.item_id = " "
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("Item can't be blank")
      end
      it "郵便番号が空では保存ができないこと" do
        @sell_item_address.postal_code = " "
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号がが半角文字列でないと出品できない' do
        @sell_item_address.postal_code = '1111111'
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("Postal code is invalid")
      end
      it "都道府県が空だと登録できない" do
        @sell_item_address.prefecture_id = 1
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it "市町村が空では登録できない" do
        @sell_item_address.city = ''
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では登録できない" do
        @sell_item_address.house_number = ''
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("House number can't be blank")
      end
      it "電話番号が空では登録できない" do
        @sell_item_address.phone_number = ''
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("Phone number can't be blank")
      end  
      it "電話番号は、10桁以上11桁以内の半角数値のみ登録できる" do
        @sell_item_address.phone_number = '00kosasa12s'
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("Phone number is invalid")
    end
       it "電話番号は、１２桁以上では登録できない" do
        @sell_item_address.phone_number = '1231231234321'
        @sell_item_address.valid?
        expect(@sell_item_address.errors.full_messages).to include("Phone number is invalid")
    end
       it "英字のみでは登録できないこと" do
       @sell_item_address.phone_number = 'kkkkkkkkkkk'
       @sell_item_address.valid?
       expect(@sell_item_address.errors.full_messages).to include("Phone number is invalid")  
     end

  end
end
end
