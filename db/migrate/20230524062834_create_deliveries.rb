class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
    
      t.string :post_code,                   null: false 
      t.integer :prefecture_id,              null: false 
      t.string :municipalitie,               null: false 
      t.string :address,                     null: false 
      t.string :building                
      t.string :tell,                        null: false 
      t.references :order,                   null: false, foreign_key: true 
      t.timestamps
    end
  end
end
