class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      
      t.references :user,            null: false, foreign_key: true 
      t.references :item,            null: false, foreign_key: true 
      t.references :deliverie,       null: false, foreign_key: true 
      t.references :form,            null: false, foreign_key: true 
      t.timestamps
  end