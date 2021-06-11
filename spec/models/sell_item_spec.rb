# require 'rails_helper'

# RSpec.describe SellItem, type: :model do
#   before do
#     @sell_item = FactoryBot.build(:sell_item)
#   end

#   context '内容に問題ない場合' do
#     it "priceがあれば保存ができること" do
#       expect(@sell_item).to be_valid
#     end
#   end

#   context '内容に問題がある場合' do
#     it "郵便番号が空では保存ができないこと" do
#       @sell_item.postal_code = " "
#       @sell_item.valid?
#       expect(@sell_item.errors.full_messages).to include("post code  can't be blank")
#     end
#     it '郵便番号がが半角文字列でないと出品できない' do
#       @sell.item.post_code = '1111111'
#       @sell.item.valid?
#       expect(@sell.item.errors.full_messages).to include('post code is not included in the list')
#     end
#     it "都道府県が空だと登録できない" do
#       @sell_item.prefecture_id = 1
#       @sell_item.valid?
#       expect(@sell_item.errors.full_messages).to include("prefecture can't be blank")
#     end
#     it "市町村が空では登録できない" do
#       @sell_item.city = ''
#       @sell_item.valid?
#       expect(@sell_item.errors.full_messages).to include("city can't be blank")
#     end
#     it "番地が空では登録できない" do
#       @sell_item.house_number = ''
#       @sell_item.valid?
#       expect(@sell_item.errors.full_messages).to include("house number can't be blank")
#     end
#     it "電話番号が空では登録できない" do
#       @sell_item.phone_number = ''
#       @sell_item.valid?
#       expect(@sell_item.errors.full_messages).to include("phone number can't be blank")
#     end  
#     it "電話番号は、10桁以上11桁以内の半角数値のみ登録できる" do
#       @sell_item.phone_number = '00kosasa12s'
#       @sell_item.valid?
#       expect(@sell_item.errors.full_messages).to include("phone number can't be blank")
#     end 
#   end
# end
