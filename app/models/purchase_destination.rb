class PurchaseDestination
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A\d{3}-\d{4}\z/, message: "は数字3桁 - 数字4桁の形式で入力してください" }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁以上11桁以内の半角数字で入力してください" }
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

  private

end