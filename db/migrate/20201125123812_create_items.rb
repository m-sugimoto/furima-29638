class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :commodity
      t.string :kategory
      t.string :price
      t.string :seller
      t.timestamps
    end
  end
end
