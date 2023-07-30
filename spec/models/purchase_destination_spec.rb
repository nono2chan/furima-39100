require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @purchase_destination = FactoryBot.build(:purchase_destination, item_id: item.id, user_id: user.id) 
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@purchase_destination).to be_valid
      end
      it 'building_nameがなくても保存できる' do
        @purchase_destination.building_name = nil
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do

      it 'post_codeが空では保存できないこと' do
        @purchase_destination.post_code = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが3桁ハイフン4桁の半角文字列ではないと保存できないこと' do
        @purchase_destination.post_code = '1234567'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Post code は数字3桁 - 数字4桁の形式で入力してください")
      end

      it "prefecture_idの値が、id:0,name:'---'の時は保存できないこと" do
        @purchase_destination.prefecture_id = 0
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Prefecture must be other than 0")
      end

      it 'cityが空では保存できないこと' do
        @purchase_destination.city = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では保存できないこと' do
        @purchase_destination.address = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numberが空では保存できないこと' do
        @purchase_destination.phone_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      
      it 'phone_numberが9桁以下の場合は保存できないこと' do
        @purchase_destination.phone_number = '123456789'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数字で入力してください")
      end

      it 'phone_numberが12桁以上の場合は保存できないこと' do
        @purchase_destination.phone_number = '123456789012'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数字で入力してください")
      end

      it 'phone_numberが半角数字でない場合は保存できないこと' do
        @purchase_destination.phone_number = '123467890a'
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Phone number は10桁以上11桁以内の半角数字で入力してください")
      end

      it 'item_idが空では保存できないこと' do
        @purchase_destination.item_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Item can't be blank")
      end

      it 'user_idが空では保存できないこと' do
        @purchase_destination.user_id = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("User can't be blank")
      end

      it 'tokenが空では保存できないこと' do
        @purchase_destination.token = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Token can't be blank")
      end
    end

  end

end
