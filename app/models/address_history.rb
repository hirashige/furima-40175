class AddressHistory
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :telephone, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id
    validates :city
    validates :address
    validates :telephone
  end

  def save
    history = History.create(
      item_id: item_id,
      user_id: user_id
    )
    ShoppingAddress.create(
      post_code: post_code,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      telephone: telephone,
      history_id: history.id
    )
  end
end
