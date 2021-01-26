class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: ""
      t.integer :prefecture_id,               null: false
      t.string :city,           default: ""
      t.string :house_number,   default: ""
      t.string :building_name,  default: ""
      t.string :telnumber,      default: ""
      t.references :order
      t.timestamps
    end
  end
end
