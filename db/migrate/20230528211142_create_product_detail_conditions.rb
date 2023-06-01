class CreateProductDetailConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_detail_conditions do |t|
      
      t.integer :product_detail_condition_id,  null: false 
     
      t.timestamps
    end
  end
end
