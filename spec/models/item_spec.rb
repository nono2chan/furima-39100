require 'rails_helper'

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'name,image,price,user,text,genre_id,quality_id,payment,_id,prefecture_id,days_idが存在していれば保存できること' do
        expect(@item).to be_valid
      end
    end
  
    context '商品出品がうまくいかないとき' do
      it 'nameが空では保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'imageが空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'textが空では保存できないこと' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'genre_idが空では保存できないこと' do
        @item.genre = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'quality_idが空では保存できないこと' do
        @item.quality = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it 'payment_idが空では保存できないこと' do
        @item.payment = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank")
      end
      it 'prefecture_idが空では保存できないこと' do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'days_idが空では保存できないこと' do
        @item.days = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空では保存できないこと' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では保存できないこと' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 9999999')
      end
      it 'priceに半角数字以外が含まれている場合は出品できないこと' do
        @item.price =  '100aa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be harf width number')
      end
      it "genre_idの値が、id: 0,name:'--'の時は保存できないこと" do
        @item.genre_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank", 'Genre is not a number')
      end
      it "quality_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.quality_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank", 'Quality is not a number')
      end
      it "payment_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.payment_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Payment can't be blank", 'Payment is not a number')
      end
      it "prefecture_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.prefecture_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank", 'Prefecture is not a number')
      end
      it "days_idの値が、id:0,name:'--'の時は保存できないこと" do
        @item.days_id = [0]
        @item.valid?
        expect(@item.errors.full_messages).to include("Days can't be blank", 'Days is not a number')
      it "userが紐づいていない場合は出品できない" do
        item = FactoryBot.build(:item, user: nil) 
        @item.vaild?
        expect(@item.errors.full_messages).to include("User must be log in")
       end
    end
  end
end
