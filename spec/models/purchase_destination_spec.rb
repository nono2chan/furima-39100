require 'rails_helper'

RSpec.describe PurchaseDestination, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user: user)
    @purchase_destination = FactoryBot.build(:purchase_destination, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての情報があれば登録できる' do
        expect(@purchase_destination).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'card_numberが空では保存できないこと' do
        @purchase_destination.card_number = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Card number can't be blank")
      end

      it 'card_exp_month' do
        @purchase_destination.card_exp_month = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Card exp month can't be blank")
      end

      it 'card_exp_year' do
        @purchase_destination.card_exp_year = nil
        @purchase_destination.valid?
        expect(@purchase_destination.errors.full_messages).to include("Card exp year can't be blank")
      end
    end

  end

end
