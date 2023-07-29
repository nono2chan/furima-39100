class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :card_number, :card_exp_month, :card_exp_year, :card_cvc, :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :card_number
    validates :card_exp_month
    validates :card_exp_year
    validates :card_cvc
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は数字3桁 - 数字4桁の形式で入力してください" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }
  end

  validate :expiration_date_must_be_in_future

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create('user_id': user_id, 'item_id': item_id)

    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

  private

  def expiration_date_must_be_in_future
    return if card_exp_month.blank? || card_exp_year.blank?
    
    expiration_date = Date.parse("#{card_exp_year}-#{card_exp_month}-31")
   
    if expiration_date < Date.today.end_of_month
      errors.add(:base, "クレジットカードの有効期限は未来の日付である必要があります")
    end
  end

end