class CreateProductDetailCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_detail_categories do |t|
      t.integer :product_detail_category_id,   null: false 
      
      t.timestamps
    end
  end
end
