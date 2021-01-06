class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :record
  has_one_attached :image
  belongs_to :postage
  belongs_to :category
  belongs_to :status
  belongs_to :sendingday

  with_options presence: true do
    validates :image
    validates :commodity
    validates :explan
    validates :price, numericality: { with: /\A[0-9]+\z/ , message:'Half-width number'}
    validates :status_id, numericality:{ other_than: 1 , message:'select'}
    validates :category_id, numericality:{ other_than: 1, message:'select' }
    validates :postage_id, numericality:{ other_than: 1 ,message:'select'}
    validates :prefecture_id, numericality:{ other_than: 0 , message:'select'}
    validates :sendingday_id, numericality:{ other_than: 1 , message:'select'}
  end
    validates_inclusion_of :price, in: 300..9_999_999, message:'is out of setting range'
end
