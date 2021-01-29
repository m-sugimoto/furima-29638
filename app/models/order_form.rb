class OrderForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telnumber, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality:{ other_than: 0 , message:'select'}
    validates :city, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
    validates :house_number
    validates :telnumber, numericality: { with: /\A[0-9]+\z/ , message:'Half-width number'}, length:{ minimum: 10, maximum: 11 }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    address = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, telnumber: telnumber, order_id: order.id)
  end
end

