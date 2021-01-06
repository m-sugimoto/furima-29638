class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :commodity
    validates :explan
    validates :price, format: { with: /\A[0-9]+\z/ , message:'Price Half-width number'}
  end
    validates :status_id, numericality:{ other_than: 1 , message:'Status select'}
    validates :category_id, numericality:{ other_than: 1, message:'Category select' }
    validates :postage_id, numericality:{ other_than: 1 ,message:'Postage select'}
    validates :prefecture_id, numericality:{ other_than: 0 , message:'prefecture select'}
    validates :sendingday_id, numericality:{ other_than: 1 , message:'sendingday select'}
    validates_inclusion_of :price, in: 300..9_999_999, message:'is out of setting range'
end
