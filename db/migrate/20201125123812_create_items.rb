class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :commodity
      t.integer :category_id
      t.string :price
      t.references :user
      t.text :explan
      t.integer :status_id
      t.integer :prefecture_id
      t.integer :postage_id
      t.integer :sendingday_id 
      t.timestamps
    end
  end
end
