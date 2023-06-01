class CreateDeliveryDays < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_days do |t|
      
      t.integer :delivery_day_id,              null: false 
      t.timestamps
    end
  end
end
