class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one :order
  has_one_attached :image
  belongs_to :postage
  belongs_to :category
  belongs_to :status
  belongs_to :sendingday
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :commodity
    validates :explan
    validates :price, numericality: { with: /\A[0-9]+\z/ , message:'Half-width number'}
    
    with_options numericality:{ other_than: 1 , message:'select'} do
      validates :status_id
      validates :category_id
      validates :postage_id
      validates :sendingday_id
    end
    validates :prefecture_id, numericality:{ other_than: 0 , message:'select'}
  end
  validates_inclusion_of :price, in: 300..9_999_999, message:'is out of setting range'
end
